<?php

namespace App\Http\Controllers\Backend\Master;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Helpers\MyHelper;
use App\Models\MY_Model;

/**
 * Description of SchemeController
 *
 * @author User
 */
class SchemeController extends Controller {

    //put your code here
    protected $MY_Model;

    public function __construct(Request $request, MY_Model $MY_Model) {
        parent::__construct($request);
        $this->MY_Model = $MY_Model;
    }

    public function create(Request $request) {
        $id = (int) base64_decode($request->id);
        $params = [
            'table_name' => 'tbl_a_permissions',
            'limit' => 1000,
            'offset' => 0,
        ];
        $permissions = $this->MY_Model->find($request, 'all', $params);
        $param_insert = [];
        if (isset($permissions['data']) && !empty($permissions['data'])) {
            foreach ($permissions['data'] AS $key => $val) {
                $param_insert[] = [
                    'group_id' => $id,
                    'permission_id' => $val->id,
                    'is_active' => 1,
                    'created_by' => $this->__user_id,
                    'created_date' => $this->MyHelper->getDateNow(),
                    'updated_by' => $this->__user_id,
                    'updated_date' => $this->MyHelper->getDateNow()
                ];
            }
        }
        $response = DB::table('tbl_b_group_scheme_permissions')->insert($param_insert);
        if ($response) {
            return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully generate scheme data', 'valid' => true]);
        } else {
            return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'failed generate scheme data.', 'valid' => false]);
        }
    }

    public function edit(Request $request, $pr_id = null) {
        $id = base64_decode($pr_id);
        $title_for_layout = config('app.default_variables.title_for_layout');
        $_breadcrumbs = [
            [
                'id' => 1,
                'title' => 'Dashboard',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri')
            ],
            [
                'id' => 2,
                'title' => 'Group permission scheme list',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri') . '/master/group/scheme/view/' . $id
            ],
            [
                'id' => 3,
                'title' => 'Group edit',
                'icon' => '',
                'arrow' => false,
                'path' => '#'
            ]
        ];
        $_config = [
            'title_for_header' => 'Update <b>Group</b> master data management page',
            'create_page' => [
                'title' => 'click to open group list page',
                'icon' => '<i class="fa-solid fa-list"></i>',
                'link' => config('app.base_extraweb_uri') . '/master/group/scheme/view/' . $id
            ]
        ];
        $group_exist = $this->get_group_exist($request);
        $params = [
            'table_name' => 'tbl_a_groups',
            'select' => ['a.id', 'a.name', 'a.description', 'a.rank', 'a.is_menu', 'a.is_group_project', 'a.is_active', 'b.id AS parent_id', 'b.name AS parent_name'],
            'join' => [
                'leftJoin' => [
                    ['tbl_a_groups as b', 'b.id', '=', 'a.parent_id']
                ]
            ],
            'conditions' => [
                'where' => [
                    ['a.id', '=', $id]
                ]
            ]
        ];
        $group = $this->MY_Model->find($request, 'first', $params);
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumbs', '_config', 'group_exist', 'group'));
    }

    public function view(Request $request, $id = null) {
        $title_for_layout = config('app.default_variables.title_for_layout');
        $_breadcrumbs = [
            [
                'id' => 1,
                'title' => 'Dashboard',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri')
            ],
            [
                'id' => 2,
                'title' => 'Group permission scheme list',
                'icon' => '',
                'arrow' => false,
                'path' => '#'
            ]
        ];
        $_config = [
            'title_for_header' => '<b>Group permission scheme</b> master data management page'
        ];
        $params = [
            'table_name' => 'tbl_b_group_scheme_permissions',
            'select' => ['a.id', 'a.group_id', 'a.permission_id', 'a.is_active', 'b.name AS group_name', 'c.name AS permission_name', 'c.path AS permission_path', 'c.controller AS permission_controller', 'c.method AS permission_method', 'c.is_basic', 'c.is_public', 'c.is_active AS permission_is_active'],
            'conditions' => [
                'where' => [
                    ['a.group_id', '=', base64_decode($id)]
                ]
            ],
            'join' => [
                'leftJoin' => [
                    ['tbl_a_groups as b', 'b.id', '=', 'a.group_id'],
                    ['tbl_a_permissions AS c', 'c.id', '=', 'a.permission_id']
                ]
            ],
            'query_param' => config('app.url') . $request->getRequestUri()
        ];
        $data = $this->MY_Model->find($request, 'first', $params);
        $_config['create_page'] = [
            'title' => 'Generate this group permission from shceme',
            'icon' => '<i class="fas fa-square-plus"></i>',
            'link' => config('app.base_extraweb_uri') . '/master/group/scheme/create?id=' . $id
        ];
        if (isset($data['data']) && !empty($data['data']) && $data['data'] != null) {
            $_config['create_page'] = [
                'title' => '',
                'icon' => '',
                'link' => ''
            ];
        }
        $param_ajaxs = [
            ['key' => 'id', 'val' => $id]
        ];
        $this->load_ajax_var($param_ajaxs);
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumbs', '_config', 'id'));
    }

    public function get_list(Request $request) {
        if (isset($request) && !empty($request)) {
            $draw = $request->draw;
            $limit = ($request->length) ? $request->length : 10;
            if ($request->length == '-1') {
                $limit = 1000;
            }
            $offset = ($request->start) ? $request->start : 0;
            $search = $request->search['value'];
            if (isset($search) && !empty($search)) {
                $conditions = [
                    'where' => [
                        ['a.group_id', '=', base64_decode($request->id)],
                        ['a.name', 'like', '%' . $search . '%']
                    ]
                ];
            } else {
                $conditions = ['where' => [
                        ['a.group_id', '=', base64_decode($request->id)]
                    ]
                ];
            }
            $params = [
                'table_name' => 'tbl_b_group_scheme_permissions',
                'select' => ['a.id', 'a.group_id', 'a.permission_id', 'a.is_active', 'b.name AS group_name', 'c.name AS permission_name', 'c.path AS permission_path', 'c.controller AS permission_controller', 'c.method AS permission_method', 'c.is_basic', 'c.is_public'],
                'conditions' => $conditions,
                'join' => [
                    'leftJoin' => [
                        ['tbl_a_groups as b', 'b.id', '=', 'a.group_id'],
                        ['tbl_a_permissions AS c', 'c.id', '=', 'a.permission_id']
                    ]
                ],
                'order' => [
                    ['a.permission_id', 'asc']
                ],
                'limit' => $limit,
                'offset' => $offset,
                'query_param' => config('app.url') . $request->getRequestUri()
            ];
            $data = $this->MY_Model->find($request, 'all', $params);
            if (isset($data['data']) && !empty($data['data'])) {
                $arrData = array();
                if ($offset == 0) {
                    $i = 1;
                } else {
                    $i = ($offset + 1);
                }
                $pcolor_ = '';
                foreach ($data['data'] AS $keyword => $value) {
                    $is_basic = '';
                    if ($value->is_basic == 1) {
                        $is_basic = ' checked';
                    }
                    $is_public = '';
                    if ($value->is_public == 1) {
                        $is_public = ' checked';
                    }
                    $is_active = '';
                    if ($value->is_active == 1) {
                        $is_active = ' checked';
                    }
                    $arrData[] = [
                        'id' => $i,
                        'group_name' => $value->group_name,
                        'permission_name' => $value->permission_name,
                        'permission_controller' => $value->permission_controller,
                        'permission_method' => $value->permission_method,
                        'is_basic' => '<input type="checkbox"' . $is_basic . ' name="is_basic" class="make-switch" data-size="small" data-id="' . base64_encode($value->id) . '" disabled>',
                        'is_public' => '<input type="checkbox"' . $is_public . ' name="is_public" class="make-switch" data-size="small" data-id="' . base64_encode($value->id) . '" disabled>',
                        'status' => '<input type="checkbox"' . $is_active . ' name="allowed[]" class="make-switch" data-size="small" data-id="' . base64_encode($value->id) . '">',
                    ];
                    if ($i <= $data['meta']['total']) {
                        $i++;
                    }
                }
                $output = array(
                    'draw' => $draw,
                    'recordsTotal' => $data['meta']['total'],
                    'recordsFiltered' => $data['meta']['total'],
                    'data' => $arrData,
                );
                echo json_encode($output);
            } else {
                echo json_encode(array());
            }
        } else {
            echo json_encode(array());
        }
    }

    public function insert(Request $request, $id) {
        $data = $request->json()->all();
        $response = false;
        if (isset($data) && !empty($data)) {
            $param = [];
            foreach ($data AS $key => $value) {
                $param[] = [
                    'group_id' => (int) base64_decode($id),
                    'permission_id' => (int) base64_decode($value['id']),
                    'is_active' => isset($value['check']) ? 1 : 0,
                    'created_by' => $this->__user_id,
                    'created_date' => $this->MyHelper->getDateNow(),
                    'updated_by' => $this->__user_id,
                    'updated_date' => $this->MyHelper->getDateNow()
                ];
            }
            dd($param);
            $response = DB::table('tbl_b_group_scheme_permissions')->insert($param);
            if ($response) {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully insert data', 'valid' => true]);
            } else {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'failed insert data.', 'valid' => false]);
            }
        }
    }

    public function update(Request $request, $pr_id = null) {
        $data = $request->json()->all();
        if (isset($data) && !empty($data)) {
            $id = (int) base64_decode($pr_id);
            $update_data = [];
            for ($i = 0; $i < count($data); $i++) {
                if (isset($data[$i]['action']) && !empty($data[$i]['action']) && $data[$i]['action'] == 'is_allowed') {
                    $update_data = [
                        'is_active' => $data[$i]['checked'],
                        'updated_by' => $this->__user_id,
                        'updated_date' => $this->MyHelper->getDateNow()
                    ];
                     DB::table('tbl_b_group_scheme_permissions')->where('id', '=', (int) base64_decode($data[$i]['group_scheme_id']))->update($update_data);
                }
            }
            $response = DB::table('tbl_b_group_scheme_permissions')->where('id', '=', $id)->update($update_data);
            if ($response) {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully update data', 'valid' => true]);
            } else {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'failed update data.', 'valid' => false]);
            }
        }
    }

    public function remove(Request $request, $pr_id = null) {
        if (isset($pr_id) && !empty($pr_id)) {
            $id = base64_decode($pr_id);
            $update_data = [
                'is_active' => 0,
                'updated_by' => $this->__user_id,
                'updated_date' => $this->MyHelper->getDateNow()
            ];
            $response = DB::table('tbl_a_groups')->where('id', '=', (int) $id)->update($update_data);
            if ($response) {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully update data', 'valid' => true]);
            } else {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'failed update data.', 'valid' => false]);
            }
        }
    }

    public function delete(Request $request, $pr_id = null) {
        if (isset($pr_id) && !empty($pr_id)) {
            $id = base64_decode($pr_id);
            $update_data = [
                'is_active' => 0,
                'updated_by' => $this->__user_id,
                'updated_date' => $this->MyHelper->getDateNow()
            ];
            $response = DB::table('tbl_a_groups')->where('id', '=', (int) $id)->update($update_data);
            if ($response) {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully update data', 'valid' => true]);
            } else {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'failed update data.', 'valid' => false]);
            }
        }
    }

}
