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
 * Description of GroupController
 *
 * @author elitebook
 */
class GroupController extends Controller {

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
                'path' => config('app.base_extraweb_uri') . '/master/group/view'
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
            'title_for_header' => 'Create new <b>Group</b> master data management page',
            'create_page' => [
                'title' => 'click to open group list page',
                'icon' => '<i class="fa-solid fa-list"></i>',
                'link' => config('app.base_extraweb_uri') . '/master/group/view'
            ]
        ];
        $group_exist = $this->get_group_exist($request);

        $params = [
            'table_name' => 'tbl_a_permissions',
            'order' => [
                ['a.id', 'asc']
            ],
            'limit' => 1000,
            'offset' => 0,
        ];
        $permissions = $this->MY_Model->find($request, 'all', $params);
        $param_menus = [
            'table_name' => 'tbl_a_menus',
            'select' => [
                'a.id', 'a.name AS menu_name', 'a.level AS menu_level', 'a.rank AS menu_rank', 'a.is_head', 'a.is_basic', 'a.parent_id', 'b.name AS parent_name'
            ],
            'join' => [
                'leftJoin' => [
                    ['tbl_a_menus AS b', 'b.id', '=', 'a.parent_id']
                ]
            ],
            'conditions' => [
                'where' => [
                    ['a.is_head', '=', 1]
                ],
            ],
            'order' => [
                ['a.id', 'asc'],
                ['a.level', 'asc']
            ],
            'limit' => 1000,
            'offset' => 0,
        ];
        $menus = $this->MY_Model->find($request, 'all', $param_menus);
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumbs', '_config', 'group_exist', 'permissions', 'menus'));
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
                'path' => config('app.base_extraweb_uri') . '/master/group/view'
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
                'link' => config('app.base_extraweb_uri') . '/master/group/view'
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
            'title_for_header' => '<b>Group</b> master data management page',
            'create_page' => [
                'title' => 'click to open form create new group',
                'icon' => '<i class="fas fa-square-plus"></i>',
                'link' => config('app.base_extraweb_uri') . '/master/group/create'
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
                    $arrData[] = [
                        'id' => $i,
                        'parent_name' => isset($value->parent_name) ? '<span style="color:#fff;padding:0px 4px 0px 4px;background-color:' . ${"pcolor_" . $value->parent_id} . ' ">#' . $value->parent_id . ' ' . $value->parent_name . '</span>' : '<span style="padding:0px 4px 0px 4px;background-color:#ccc;">system</span>',
                        'name' => '<span style="color:#fff;padding:0px 4px 0px 4px;background-color:' . ${"pcolor_" . $value->id} . ' ">' . $value->name . '</span>',
                        'description' => $value->description,
                        'rank' => $value->rank,
                        'group_project' => '<input type="checkbox"' . $is_group_project . ' name="is_group_project" class="make-switch" data-size="small" data-id="' . base64_encode($value->id) . '">',
                        'menu' => '<input type="checkbox"' . $is_menu . ' name="is_menu" class="make-switch" data-size="small" data-id="' . base64_encode($value->id) . '">',
                        'status' => '<input type="checkbox"' . $is_active . ' name="is_active" class="make-switch" data-size="small" data-id="' . base64_encode($value->id) . '">',
                        'action' => '<div class="btn-group">
                        <button type="button" class="btn btn-info"><a href="' . config('app.base_extraweb_uri') . '/master/group/edit/' . base64_encode($value->id) . '" style="color:#fff;font-size:14px;" title="Edit"><i class="fas fa-edit"></i></a></button>
                        <button type="button" class="btn btn-info"><a href="' . config('app.base_extraweb_uri') . '/master/group/remove/' . base64_encode($value->id) . '" style="color:#fff;font-size:14px;" title="Remove"><i class="fas fa-xmark"></i></a></button>
                        <button type="button" class="btn btn-info"><a href="' . config('app.base_extraweb_uri') . '/master/group/delete/' . base64_encode($value->id) . '" style="color:#fff;font-size:14px;" title="Add"><i class="far fa-trash-alt"></i></a></button>
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
        } else {
            echo json_encode(array());
        }
    }

    public function insert(Request $request) {
        $data = $request->json()->all();
        $response = false;
        if (isset($data) && !empty($data)) {
            $param = [
                'name' => $data['name'],
                'description' => $data['description'],
                'rank' => isset($data['rank']) ? $data['rank'] : 0,
                'level' => 0,
                'is_group_project' => isset($data['is_group_project']) ? 1 : 0,
                'is_menu' => isset($data['is_menu']) ? 1 : 0,
                'is_active' => isset($data['is_active']) ? 1 : 0,
                'created_by' => $this->__user_id,
                'created_date' => $this->MyHelper->getDateNow(),
                'updated_by' => $this->__user_id,
                'updated_date' => $this->MyHelper->getDateNow()
            ];
            $group_id = DB::table('tbl_a_groups')->insertGetId($param);
            if ($group_id) {
                if (isset($data['permission']) && !empty($data['permission'])) {
                    $this->insert_group_permission($request, $data['permission'], $group_id);
                }
                if (isset($data['menu']) && !empty($data['menu'])) {
                    $this->insert_menu_permission($request, $data['menu'], $group_id);
                }
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully insert data', 'valid' => true]);
            } else {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'failed insert data.', 'valid' => false]);
            }
        }
    }

    protected function insert_group_permission($request, $data, $group_id) {
        $paramPermission = [];
        foreach ($data AS $keyword => $value) {
            $paramPermission[] = [
                'group_id' => $group_id,
                'permission_id' => (int) $value,
                'module_id' => isset($data['module_id']) ? $data['module_id'] : 3,
                'is_allowed' => 1,
                'is_active' => 1,
                'created_by' => $this->__user_id,
                'created_date' => $this->MyHelper->getDateNow(),
                'updated_by' => $this->__user_id,
                'updated_date' => $this->MyHelper->getDateNow()
            ];
        }
        return DB::table('tbl_b_group_permissions')->insert($paramPermission);
    }

    protected function insert_menu_permission($request, $data, $group_id) {
        if (isset($data) && !empty($data)) {
            $param_menu = [
                'table_name' => 'tbl_a_menus',
                'conditions' => [
                    'whereIn' => [
                        ['a.id', $data]
                    ]
                ],
                'order' => [
                    ['a.level', 'desc']
                ],
            ];
            $menu_selected = $this->MY_Model->find($request, 'all', $param_menu);
            $menu = [];
            if ($menu_selected['data']) {
                foreach ($menu_selected['data'] AS $keyword => $value) {
                    //check this parent exist
                    $param_menu2 = [
                        'table_name' => 'tbl_a_menus',
                        'conditions' => [
                            'where' => [
                                ['a.id', '=', $value->parent_id]
                            ]
                        ],
                    ];
                    $menu_parent = $this->MY_Model->find($request, 'first', $param_menu2)['data'];
                    if (isset($menu_parent) && !empty($menu_parent)) {
                        $menu[$keyword] = array_merge($this->MyHelper->convertToArray($value), array('parent' => $this->MyHelper->convertToArray($menu_parent)));
                    } else {
                        $menu[$keyword] = $this->MyHelper->convertToArray($value);
                    }
                }
            }
            $parent_id = [];
            if ($menu) {
                foreach ($menu AS $key => $val) {
                    $parent_id[] = $val['id'];
                    if (isset($val['parent']) && !empty($val['parent'])) {
                        if (!in_array($val['parent']['id'], $parent_id)) {
                            $parent_id[] = $val['parent']['id'];
                        }
                    }
                }
            }
            $param_menu_all = [
                'table_name' => 'tbl_a_menus',
                'conditions' => [
                    'where' => [
                        ['a.is_active', '=', 1]
                    ]
                ],
                'limit' => 1000
            ];
            $menu_all = $this->MY_Model->find($request, 'all', $param_menu_all);
            $menu_permission = [];
            if ($menu_all['data']) {
                foreach ($menu_all['data'] AS $key => $val) {
                    $allowed = 0;
                    if (in_array($val->id, $parent_id)) {
                        $allowed = 1;
                    }
                    $menu_permission[] = [
                        'menu_id' => $val->id,
                        'group_id' => $group_id,
                        'module_id' => isset($data['module_id']) ? $data['module_id'] : 3,
                        'is_allowed' => $allowed,
                        'is_active' => 1,
                        'created_by' => $this->__user_id,
                        'created_date' => $this->MyHelper->getDateNow(),
                        'updated_by' => $this->__user_id,
                        'updated_date' => $this->MyHelper->getDateNow()
                    ];
                }
            }
            return DB::table('tbl_b_menu_permission')->insert($menu_permission);
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

    protected function get_group_exist($request) {
        $params = [
            'table_name' => 'tbl_a_groups',
            'select' => ['a.id', 'a.name', 'a.rank', 'a.description', 'b.id AS parent_id', 'b.name AS parent_name'],
            'join' => [
                'leftJoin' => [
                    ['tbl_a_groups as b', 'b.id', '=', 'a.parent_id']
                ]
            ],
            'order' => [
                ['a.id', 'asc']
            ],
            'limit' => 100,
            'offset' => 0,
            'query_param' => config('app.url') . $request->getRequestUri()
        ];
        return $this->MY_Model->find($request, 'all', $params);
    }

}
