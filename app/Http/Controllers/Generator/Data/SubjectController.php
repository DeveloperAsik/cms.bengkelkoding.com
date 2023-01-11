<?php

namespace App\Http\Controllers\Generator\Data;

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
 * Description of SubjectController
 *
 * @author User
 */
class SubjectController extends Controller {

    //put your code here
    protected $MY_Model;

    public function __construct(Request $request, MY_Model $MY_Model) {
        parent::__construct($request);
        $this->MY_Model = $MY_Model;
    }

    public function create(Request $request) {
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
                'title' => 'Group list',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri') . '/generator/data/subject/view'
            ],
            [
                'id' => 3,
                'title' => 'Group create new',
                'icon' => '',
                'arrow' => false,
                'path' => '#'
            ]
        ];
        $_config = [
            'title_for_header' => 'Create new <b>Generator Subject</b> master data management page',
            'create_page' => [
                'title' => 'click to open group list page',
                'icon' => '<i class="fa-solid fa-list"></i>',
                'link' => config('app.base_extraweb_uri') . '/generator/data/subject/view'
            ]
        ];
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumbs', '_config'));
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
                'title' => 'Group list',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri') . '/generator/data/subject/view'
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
                'link' => config('app.base_extraweb_uri') . '/generator/data/subject/view'
            ]
        ];
        $params = [
            'table_name' => 'tbl_a_generator_subjects',
            'conditions' => [
                'where' => [
                    ['a.id', '=', $id]
                ]
            ]
        ];
        $group = $this->MY_Model->find($request, 'first', $params, 'mysql_generator');
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumbs', '_config', 'group_exist', 'group'));
    }

    public function view(Request $request) {
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
                'title' => 'Group list',
                'icon' => '',
                'arrow' => false,
                'path' => '#'
            ]
        ];
        $_config = [
            'title_for_header' => '<b>Generator Subject</b> master data management page',
            'create_page' => [
                'title' => 'click to open form create new group',
                'icon' => '<i class="fas fa-square-plus"></i>',
                'link' => config('app.base_extraweb_uri') . '/generator/data/subject/create'
            ]
        ];

        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumbs', '_config'));
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
                        ['a.name', 'like', '%' . $search . '%']
                    ]
                ];
            } else {
                $conditions = [];
            }
            $params = [
                'table_name' => 'tbl_a_generator_subjects',
                'order' => [
                    ['a.id', 'asc']
                ],
                'limit' => $limit,
                'offset' => $offset,
                'query_param' => config('app.url') . $request->getRequestUri()
            ];
            $data = $this->MY_Model->find($request, 'all', $params, 'mysql_generator');
            if (isset($data['data']) && !empty($data['data'])) {
                $arrData = array();
                if ($offset == 0) {
                    $i = 1;
                } else {
                    $i = ($offset + 1);
                }
                foreach ($data['data'] AS $keyword => $value) {
                    $is_active = '';
                    if ($value->is_active == 1) {
                        $is_active = ' checked';
                    }
                    $arrData[] = [
                        'id' => $i,
                        'code' => $value->code,
                        'name' => $value->name,
                        'description' => $value->description,
                        'status' => '<input type="checkbox"' . $is_active . ' name="is_active" class="make-switch" data-size="small" data-id="' . base64_encode($value->id) . '">',
                        'action' => '<div class="btn-group">
                        <button type="button" class="btn btn-info"><a href="' . config('app.base_extraweb_uri') . '/generator/data/subject/remove/' . base64_encode($value->id) . '" style="color:#fff;font-size:14px;" title="Remove"><i class="fas fa-xmark"></i></a></button>
                        <button type="button" class="btn btn-info"><a href="' . config('app.base_extraweb_uri') . '/generator/data/subject/delete/' . base64_encode($value->id) . '" style="color:#fff;font-size:14px;" title="Add"><i class="far fa-trash-alt"></i></a></button>
                      </div>',
                    ];
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

    public function insert(Request $request) {
        $data = $request->json()->all();
        $response = false;
        if (isset($data) && !empty($data)) {
            $param = [
                'table_name' => 'tbl_a_generator_subjects',
                'data' => [
                    'code' => $this->MyHelper->getRandomChar(12),
                    'name' => $data['name'],
                    'description' => $data['description'],
                    'is_active' => isset($data['is_active']) ? 1 : 0,
                    'created_by' => $this->__user_id,
                    'created_date' => $this->MyHelper->getDateNow(),
                    'updated_by' => $this->__user_id,
                    'updated_date' => $this->MyHelper->getDateNow()
                ]
            ];
            $response = $this->MY_Model->__insert($request, $param, 'mysql_generator');
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
            $id = base64_decode($pr_id);
            switch ($data['action']) {
                case 'is_group_project':
                    $update_data = [
                        'is_group_project' => $data['is_group_project'],
                        'updated_by' => $this->__user_id,
                        'updated_date' => $this->MyHelper->getDateNow()
                    ];
                    break;
                case 'is_menu':
                    $update_data = [
                        'is_menu' => $data['is_menu'],
                        'updated_by' => $this->__user_id,
                        'updated_date' => $this->MyHelper->getDateNow()
                    ];
                    break;
                case 'is_active':
                    $update_data = [
                        'is_active' => $data['is_active'],
                        'updated_by' => $this->__user_id,
                        'updated_date' => $this->MyHelper->getDateNow()
                    ];
                    break;
                default:
                    $update_data = [
                        'name' => $data['name'],
                        'description' => $data['description'],
                        'rank' => $data['rank'],
                        'is_group_project' => isset($data['is_group_project']) ? 1 : 0,
                        'is_menu' => isset($data['is_menu']) ? 1 : 0,
                        'is_active' => isset($data['is_active']) ? 1 : 0,
                        'updated_by' => $this->__user_id,
                        'updated_date' => $this->MyHelper->getDateNow()
                    ];
                    break;
            }
            $response = DB::table('tbl_a_groups')->where('id', '=', (int) $id)->update($update_data);
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
