<?php

namespace App\Http\Controllers\Backend\Prefferences;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Helpers\MyHelper;
use App\Helpers\Oreno\Date;
use App\Http\Middleware\TokenUser;
use Illuminate\Support\Facades\DB;
use App\Models\MY_Model;

/**
 * Description of GroupPermissionController
 *
 * @author User
 */
class GroupPermissionController extends Controller {

    //put your code here
    protected $MY_Model;
    protected $table_default = 'tbl_b_group_permissions';

    public function __construct(Request $request, MY_Model $MY_Model) {
        parent::__construct($request);
        $this->MY_Model = $MY_Model;
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
                'title' => 'Group Permission List',
                'icon' => '',
                'arrow' => false,
                'path' => config('app.base_extraweb_uri') . '/prefferences/group/permissions/view'
            ]
        ];
        $_config = [
            'title_for_header' => '<b>Group Permissions</b> master data management page',
            'create_page' => [
                'title' => '',
                'icon' => '',
                'link' => ''
            ]
        ];
        $page = 'default';
        $id = 0;
        if (isset($request->p) && !empty($request->p)) {
            $id = $request->id;
            $param_groups = [
                'table_name' => 'tbl_a_groups',
                'conditions' => [
                    'where' => [
                        ['a.id', '=', base64_decode($id)]
                    ]
                ]
            ];
            $group = $this->MY_Model->find($request, 'first', $param_groups);
            switch ($request->p) {
                case "detail-group-permission":
                    $page = $request->p;
                    $_config = [
                        'title_for_header' => '<b>Group Permissions (' . $group['data']->name . ') </b> master data management page',
                        'create_page' => [
                            'title' => '',
                            'icon' => '',
                            'link' => '#'
                        ]
                    ];
                    break;
                default:
                    $page = $request->p;
                    $_config = [
                        'title_for_header' => '<b>Menu Permissions (' . $group['data']->name . ') </b> master data management page',
                        'create_page' => [
                            'title' => '',
                            'icon' => '',
                            'link' => '#'
                        ]
                    ];
                    break;
            }
        }
        $param_ajaxs = [
            ['key' => 'page', 'val' => $page],
            ['key' => 'id', 'val' => $id]
        ];
        $this->load_ajax_var($param_ajaxs);
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumbs', '_config', 'page'));
    }

    public function get_list(Request $request) {
        if (isset($request) && !empty($request)) {
            if ($request->a && $request->a == 1) {
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
                    'table_name' => 'tbl_a_groups',
                    'select' => ['a.id', 'a.name', 'a.rank', 'a.is_menu', 'a.is_group_project', 'a.is_active', 'a.description', 'b.id AS parent_id', 'b.name AS parent_name'],
                    'conditions' => $conditions,
                    'join' => [
                        'leftJoin' => [
                            ['tbl_a_groups as b', 'b.id', '=', 'a.parent_id']
                        ]
                    ],
                    'order' => [
                        ['b.parent_id', 'asc']
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
                        $rand_color = '#' . str_pad(dechex(mt_rand(0, 0xFFFFFF)), 6, '0', STR_PAD_LEFT);
                        $is_menu = '';
                        if ($value->is_menu == 1) {
                            $is_menu = ' checked';
                        }
                        $is_group_project = '';
                        if ($value->is_group_project == 1) {
                            $is_group_project = ' checked';
                        }
                        $is_active = '';
                        if ($value->is_active == 1) {
                            $is_active = ' checked';
                        }
                        ${"pcolor_" . $value->id} = $rand_color;
                        $btn_add_permission = '';
                        if ($this->get_group_permissions($request, $value->id)['meta']['total'] == 0) {
                            $btn_add_permission = '<button type="button" class="btn btn-info"><a href="' . config('app.base_extraweb_uri') . '/prefferences/group/permissions/create?id=' . base64_encode($value->id) . '" style="color:#fff;font-size:14px;" title="Generate Group permission"><i class="fas fa-list"></i></a></button>';
                        }
                        $parent_id = 0;
                        if (isset($value->parent_id) && !empty($value->parent_id)) {
                            $parent_id = $value->parent_id;
                            ${"pcolor_" . $parent_id} = $rand_color;
                        }
                        $arrData[] = [
                            'id' => $i,
                            'parent_name' => isset($value->parent_name) ? '<span style="color:#fff;padding:0px 4px 0px 4px;background-color:' . ${"pcolor_" . $parent_id} . ' ">#' . $parent_id . ' ' . $value->parent_name . '</span>' : '<span style="padding:0px 4px 0px 4px;background-color:#ccc;">system</span>',
                            'name' => '<span style="color:#fff;padding:0px 4px 0px 4px;background-color:' . ${"pcolor_" . $value->id} . ' ">' . $value->name . '</span>',
                            'description' => $value->description,
                            'rank' => $value->rank,
                            'group_project' => '<input type="checkbox"' . $is_group_project . ' disabled name="is_group_project" class="make-switch" data-size="small" data-id="' . base64_encode($value->id) . '">',
                            'menu' => '<input type="checkbox"' . $is_menu . ' disabled name="is_menu" class="make-switch" data-size="small" data-id="' . base64_encode($value->id) . '">',
                            'status' => '<input type="checkbox"' . $is_active . ' name="is_active" class="make-switch" data-size="small" data-id="' . base64_encode($value->id) . '">',
                            'action' => '<div class="btn-group">
                        <button type="button" class="btn btn-info"><a href="' . config('app.base_extraweb_uri') . '/prefferences/group/permissions/view?p=detail-group-permission&id=' . base64_encode($value->id) . '" style="color:#fff;font-size:14px;" title="Group Permissions"><i class="fas fa-users"></i></a></button>
                        <button type="button" class="btn btn-info"><a href="' . config('app.base_extraweb_uri') . '/prefferences/group/permissions/view?p=detail-menu-permission&id=' . base64_encode($value->id) . '" style="color:#fff;font-size:14px;" title="Menu Permissions"><i class="fas fa-list"></i></a></button>
                      </div>',
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
            } elseif ($request->a && $request->a == 2) {
                $group_id = base64_decode($request->id);
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
                            ['a.group_id', '=', $group_id]
                        ],
                        'orWhere' => [
                            ['a.group_id', 'like', '%' . $search . '%'],
                            ['a.permission_id', 'like', '%' . $search . '%'],
                            ['a.module_id', 'like', '%' . $search . '%'],
                            ['b.name', 'like', '%' . $search . '%'],
                            ['c.name', 'like', '%' . $search . '%'],
                            ['d.name', 'like', '%' . $search . '%'],
                        ]
                    ];
                } else {
                    $conditions = [
                        'where' => [
                            ['a.group_id', '=', $group_id]
                        ]
                    ];
                }
                $params = [
                    'table_name' => $this->table_default,
                    'select' => [
                        'a.*',
                        'b.name AS group_name',
                        'c.name AS module_name',
                        'd.name AS permission_name', 'd.path AS permission_path', 'd.controller AS permission_controller', 'd.method AS permission_method'
                    ],
                    'join' => [
                        'leftJoin' => [
                            ['tbl_a_groups AS b', 'b.id', '=', 'a.group_id'],
                            ['tbl_a_modules AS c', 'c.id', '=', 'a.module_id'],
                            ['tbl_a_permissions AS d', 'd.id', '=', 'a.permission_id']
                        ]
                    ],
                    'conditions' => $conditions,
                    'order' => [
                        ['a.id', 'asc']
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
                    foreach ($data['data'] AS $keyword => $value) {
                        $is_allowed = '';
                        if ($value->is_allowed == 1) {
                            $is_allowed = ' checked';
                        }
                        $is_active = '';
                        if ($value->is_active == 1) {
                            $is_active = ' checked';
                        }
                        $arrData[] = [
                            'id' => $i,
                            'group_name' => $value->group_name,
                            'module_name' => $value->module_name,
                            'permission_name' => $value->permission_name,
                            'permission_path' => $value->permission_path,
                            'permission_controller' => $value->permission_controller,
                            'permission_method' => $value->permission_method,
                            'is_allowed' => '<input type="checkbox"' . $is_allowed . ' name="is_allowed" class="make-switch" data-size="small" data-id="' . base64_encode($value->id) . '">',
                            'is_active' => '<input type="checkbox"' . $is_active . ' name="is_active" class="make-switch" data-size="small" data-id="' . base64_encode($value->id) . '">',
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
            } elseif ($request->a && $request->a == 3) {
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
                                ['a.name', 'like', '%' . $search . '%'],
                                ['c.group_id', '=', base64_decode($request->id)]
                            ]
                        ];
                    } else {
                        $conditions = [
                            'where' => [
                                ['c.group_id', '=', base64_decode($request->id)]
                            ]
                        ];
                    }
                    $params = [
                        'table_name' => 'tbl_a_menus',
                        'select' => ['a.id', 'a.name', 'a.level', 'a.rank', 'b.id AS parent_menu_id', 'b.name AS parent_menu_name', 'c.id AS menu_permission_id', 'c.is_allowed', 'c.is_active'],
                        'conditions' => $conditions,
                        'join' => [
                            'leftJoin' => [
                                ['tbl_a_menus AS b', 'b.id', '=', 'a.parent_id'],
                                ['tbl_b_menu_permission AS c', 'c.menu_id', '=', 'a.id']
                            ]
                        ],
                        'order' => [
                            ['a.id', 'asc']
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
                            $rand_color = '#' . str_pad(dechex(mt_rand(0, 0xFFFFFF)), 6, '0', STR_PAD_LEFT);
                            $is_allowed = '';
                            if ($value->is_allowed == 1) {
                                $is_allowed = ' checked';
                            }
                            $is_active = '';
                            if ($value->is_active == 1) {
                                $is_active = ' checked';
                            }
                            $parent_id = $value->parent_menu_id;
                            $parent_name = $value->parent_menu_name;
                            if ($parent_id == 0 || $parent_id == null) {
                                $parent_id = 0;
                                $parent_name = 'Root';
                            }
                            ${"pcolor_" . $value->id} = $rand_color;
                            ${"pcolor_" . $parent_id} = $rand_color;
                            $arrData[] = [
                                'id' => $i,
                                'name' => '<span style="color:#fff;padding:0px 4px 0px 4px;background-color:' . ${"pcolor_" . $value->id} . ' ">' . $value->name . '</span>',
                                'parent_name' => '<span style="color:#fff;padding:0px 4px 0px 4px;background-color:' . ${"pcolor_" . $parent_id} . ' ">' . $parent_name . '</span>',
                                'level' => $value->level,
                                'rank' => $value->rank,
                                'is_allowed' => '<input type="checkbox"' . $is_allowed . ' name="is_allowed" class="make-switch" data-size="small" data-id="' . base64_encode($value->id) . '">',
                                'status' => '<input type="checkbox"' . $is_active . ' name="is_active" class="make-switch" data-size="small" data-id="' . base64_encode($value->id) . '">',
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
        } else {
            echo json_encode(array());
        }
    }

    public function insert(Request $request) {
        $data = $request->json()->all();
        $response = false;
        if (isset($data) && !empty($data)) {
            $arrDataCorrect = [];
            if (isset($data['permission_id']) && !empty($data['permission_id'])) {
                foreach ($data['permission_id'] AS $k => $v) {
                    $params = [
                        'table_name' => 'tbl_b_group_permissions',
                        'conditions' => [
                            'where' => [
                                ['a.module_id', '=', $data['module_id']],
                                ['a.group_id', '=', $data['group_id']],
                                ['a.permission_id', '=', $data['permission_id']]
                            ]
                        ]
                    ];
                    $groupPermission_exist = $this->MY_Model->find($request, 'first', $params);
                    if ($groupPermission_exist['data'] == null) {
                        $arrDataCorrect[] = [
                            'module_id' => (int) $data['module_id'],
                            'group_id' => (int) $data['group_id'],
                            'permission_id' => (int) $v,
                            'is_allowed' => isset($data['is_allowed']) ? $data['is_allowed'] : 0,
                            'is_active' => isset($data['is_active']) ? $data['is_active'] : 0,
                            'created_by' => $this->__user_id,
                            'created_date' => $this->Date->now(),
                            'updated_by' => $this->__user_id,
                            'updated_date' => $this->Date->now()
                        ];
                    }
                }
            }
            $response = DB::table('tbl_b_group_permissions')->insert($arrDataCorrect);
            if ($response) {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully insert data', 'valid' => true]);
            } else {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'failed insert data. user already exist or this user email already used.', 'valid' => false]);
            }
        }
    }

    public function update(Request $request, $pr_id = null) {
        $data = $request->json()->all();
        $id = (int) base64_decode($pr_id);
        if (isset($data) && !empty($data)) {
            if (isset($request->a) && !empty($request->a)) {
                switch ($request->a) {
                    case 1 :
                        $param_group_permission = [
                            'is_allowed' => isset($data['is_allowed']) ? $data['is_allowed'] : 0,
                            'updated_by' => $this->__user_id,
                            'updated_date' => $this->Date->now(),
                        ];
                        $result = DB::table('tbl_b_group_permissions')->where('id', '=', $id)->update($param_group_permission);
                        if ($result) {
                            return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully update group permission.', 'valid' => true]);
                        } else {
                            return $this->MyHelper->_set_response('json', ['code' => 500, 'message' => 'Failed update group permission.', 'valid' => false]);
                        }
                        break;
                    case 2 :
                        $group_permission = [
                            'is_active' => isset($data['is_active']) ? $data['is_active'] : 0,
                            'updated_by' => $this->__user_id,
                            'updated_date' => $this->Date->now(),
                        ];
                        $result = DB::table('tbl_b_group_permissions')->where('id', '=', $id)->update($param_group_permission);
                        if ($result) {
                            return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully update group permission.', 'valid' => true]);
                        } else {
                            return $this->MyHelper->_set_response('json', ['code' => 500, 'message' => 'Failed update group permission.', 'valid' => false]);
                        }
                        break;

                    case 3:
                        $param_group_permission = [
                            'is_allowed' => isset($data['is_allowed']) ? $data['is_allowed'] : 0,
                            'updated_by' => $this->__user_id,
                            'updated_date' => $this->Date->now(),
                        ];
                        $result = DB::table('tbl_b_menu_permission')->where('id', '=', $id)->update($param_group_permission);
                        if ($result) {
                            return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully update menu permission.', 'valid' => true]);
                        } else {
                            return $this->MyHelper->_set_response('json', ['code' => 500, 'message' => 'Failed update menu permission.', 'valid' => false]);
                        }
                        break;
                    case 4:
                        $param_group_permission = [
                            'is_active' => isset($data['is_active']) ? $data['is_active'] : 0,
                            'updated_by' => $this->__user_id,
                            'updated_date' => $this->Date->now(),
                        ];
                        $result = DB::table('tbl_b_menu_permission')->where('id', '=', $id)->update($param_group_permission);
                        if ($result) {
                            return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully update menu permission.', 'valid' => true]);
                        } else {
                            return $this->MyHelper->_set_response('json', ['code' => 500, 'message' => 'Failed update menu permission.', 'valid' => false]);
                        }
                        break;
                }
            } else {
                $param_group_permission = [
                    'is_active' => isset($data['is_active']) ? $data['is_active'] : 0,
                    'updated_by' => $this->__user_id,
                    'updated_date' => $this->Date->now(),
                ];
                $result = DB::table('tbl_a_groups')->where('id', '=', $id)->update($param_group_permission);
                if ($result) {
                    return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully update group permission.', 'valid' => true]);
                } else {
                    return $this->MyHelper->_set_response('json', ['code' => 500, 'message' => 'Failed update group permission.', 'valid' => false]);
                }
            }
        } else {
            return $this->MyHelper->_set_response('json', ['code' => 500, 'message' => 'Failed insert new permission data.', 'valid' => false]);
        }
    }

}
