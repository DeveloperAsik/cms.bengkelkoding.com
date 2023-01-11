<?php

namespace App\Http\Controllers\Backend\Master;

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
 * Description of UsersController
 *
 * @author elitebook
 */
class UserController extends Controller {

    //put your code here
    protected $MY_Model;
    protected $Date;
    protected $TokenUser;
    protected $table_default = 'tbl_a_users';

    public function __construct(Request $request, MY_Model $MY_Model) {
        parent::__construct($request);
        $this->MY_Model = $MY_Model;
        $this->Date = new Date();
        $this->TokenUser = new TokenUser();
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
                'title' => 'User list',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri') . '/master/user/view'
            ],
            [
                'id' => 3,
                'title' => 'User create new',
                'icon' => '',
                'arrow' => false,
                'path' => '#'
            ]
        ];
        $_config = [
            'title_for_header' => 'Create new <b>User</b> master data management page',
            'create_page' => [
                'title' => 'click to open group list page',
                'icon' => '<i class="fa-solid fa-list"></i>',
                'link' => config('app.base_extraweb_uri') . '/master/user/view'
            ]
        ];
        $param_group = [
            'table_name' => 'tbl_a_groups',
            'select' => ['a.id', 'a.name', 'a.description', 'a.rank', 'a.is_menu', 'a.is_active', 'b.id AS parent_id', 'b.name AS parent_name'],
            'conditions' => [
                'where' => [
                    ['a.is_menu', '=', 1]
                ]
            ],
            'join' => [
                'leftJoin' => [
                    ['tbl_a_groups as b', 'b.id', '=', 'a.parent_id']
                ]
            ],
            'order' => [
                ['a.id', 'asc']
            ],
        ];
        $groups = $this->MY_Model->find($request, 'all', $param_group);
        $param_modules = [
            'table_name' => 'tbl_a_modules',
            'order' => [
                ['a.id', 'asc']
            ],
        ];
        $modules = $this->MY_Model->find($request, 'all', $param_modules);
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumbs', '_config', 'groups', 'modules'));
    }

    public function view(Request $request) {
        $title_for_layout = config('app.default_variables.title_for_layout');
        $_breadcrumb = [
            [
                'id' => 1,
                'title' => 'Dashboard',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri')
            ],
            [
                'id' => 2,
                'title' => 'User Permission',
                'icon' => '',
                'arrow' => false,
                'path' => config('app.base_extraweb_uri') . '/master/user/view'
            ]
        ];
        $_config = [
            'title_for_header' => '<b>Users</b> master data management page',
            'create_page' => [
                'title' => 'click to open form create new user',
                'icon' => '<i class="fas fa-square-plus"></i>',
                'link' => config('app.base_extraweb_uri') . '/master/user/create'
            ]
        ];
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumb', '_config'));
    }

    public function edit(Request $request, $pr_id = null) {
        $id = base64_decode($pr_id);
        $title_for_layout = config('app.default_variables.title_for_layout');
        $_breadcrumb = [
            [
                'id' => 1,
                'title' => 'Dashboard',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri')
            ],
            [
                'id' => 2,
                'title' => 'User Permission',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri') . '/master/user/view'
            ],
            [
                'id' => 3,
                'title' => 'User Edit',
                'icon' => '',
                'arrow' => false,
                'path' => config('app.base_extraweb_uri') . '/master/user/edit/' . $id
            ]
        ];
        $_config = [
            'title_for_header' => 'Update <b>User</b> master data management page',
            'create_page' => [
                'title' => 'click to open user list page',
                'icon' => '<i class="fa-solid fa-list"></i>',
                'link' => config('app.base_extraweb_uri') . '/master/user/view'
            ]
        ];
        $params = [
            'table_name' => 'Tbl_a_users',
            'select' => ['a.id', 'a.user_name', 'a.first_name', 'a.last_name', 'a.email', 'a.is_active', 'a.description', 'b.id AS user_group_id', 'c.id AS group_id', 'c.name AS group_name'],
            'join' => [
                'leftJoin' => [
                    ['tbl_b_user_groups as b', 'b.user_id', '=', 'a.id'],
                    ['tbl_a_groups as c', 'c.id', '=', 'b.group_id']
                ]
            ],
            'conditions' => [
                'where' => [
                    ['a.id', '=', $id]
                ]
            ]
        ];
        $user = $this->MY_Model->find($request, 'first', $params)['data'];
        $param_groups = [
            'table_name' => 'tbl_a_groups',
        ];
        $groups = $this->MY_Model->find($request, 'list', $param_groups);
        $untouchable = 0;
        if ($id == 1 || $id == 2) {
            $untouchable = 1;
        }
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumb', '_config', 'id', 'user', 'groups', 'untouchable'));
    }

    public function get_list(Request $request) {
        if (isset($request) && !empty($request)) {
            if ($request->a && $request->a == 1) {
                return $this->get_list_auth($request);
            } elseif ($request->a && $request->a == 2) {
                return $this->get_list_permission($request);
            } elseif ($request->a && $request->a == 3) {
                return $this->get_list_menu($request);
            } elseif ($request->a && $request->a == 4) {
                return $this->get_list_user_permissions($request);
            } else {
                $draw = $request['draw'];
                $limit = ($request->length) ? $request->length : 10;
                if ($request->length == '-1') {
                    $limit = 1000;
                }
                $offset = ($request->start) ? $request->start : 0;
                $search = $request['search']['value'];
                if (isset($search) && !empty($search)) {
                    $conditions = [
                        'orWhere' => [
                            ['a.user_name', 'like', '%' . $search . '%'],
                            ['a.first_name', 'like', '%' . $search . '%'],
                            ['a.last_name', 'like', '%' . $search . '%'],
                            ['a.email', 'like', '%' . $search . '%'],
                        ]
                    ];
                } else {
                    $conditions = [];
                }
                $params = [
                    'table_name' => $this->table_default,
                    'select' => ['a.*', 'b.id AS user_group_id', 'c.id AS group_id', 'c.name AS group_name'],
                    'join' => [
                        'leftJoin' => [
                            ['tbl_b_user_groups AS b', 'b.user_id', '=', 'a.id'],
                            ['tbl_a_groups AS c', 'c.id', '=', 'b.group_id']
                        ]
                    ],
                    'conditions' => $conditions,
                    'order' => [
                        ['c.level', 'desc'],
                        ['a.user_name', 'asc']
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
                        $is_active = '';
                        if ($value->is_active == 1) {
                            $is_active = ' checked';
                        }
                        $arrData[] = [
                            'id' => $i,
                            'user_name' => strtolower($value->user_name),
                            'first_name' => ucfirst($value->first_name),
                            'last_name' => ucfirst($value->last_name),
                            'email' => strtolower($value->email),
                            'group_name' => $value->group_name,
                            'description' => $value->description,
                            'is_active' => '<input type="checkbox"' . $is_active . ' name="is_active" class="make-switch" data-size="small">',
                            'action' => '<div class="btn-group">
                                <button type="button" class="btn btn-info"><a href="' . config('app.base_extraweb_uri') . '/prefferences/user/permissions/view?p=detail&id=' . base64_encode($value->id) . '" style="color:#fff;font-size:14px;" title="User permission"><i class="fas fa-list"></i></a></button>
                                <button type="button" class="btn btn-info"><a href="' . config('app.base_extraweb_uri') . '/master/user/edit/' . base64_encode($value->id) . '?a=' . base64_encode($value->user_group_id) . '" style="color:#fff;font-size:14px;" title="Edit"><i class="fas fa-edit"></i></a></button>
                                <button type="button" class="btn btn-info"><a href="' . config('app.base_extraweb_uri') . '/master/user/remove/' . base64_encode($value->id) . '" style="color:#fff;font-size:14px;" title="Remove"><i class="fas fa-xmark"></i></a></button>
                            </div>'
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
            }
        } else {
            echo json_encode(array());
        }
    }

    public function get_list_auth(Request $request) {
        if (isset($request) && !empty($request)) {
            $draw = $request->draw;
            $limit = ($request->length) ? $request->length : 10;
            $offset = ($request->start) ? $request->start : 0;
            $search = $request->search['value'];
            if (isset($search) && !empty($search)) {
                $conditions = [
                    'orWhere' => [
                        ['b.name', 'like', '%' . $search . '%'],
                        ['c.name', 'like', '%' . $search . '%'],
                        ['c.path', 'like', '%' . $search . '%'],
                        ['c.controller', 'like', '%' . $search . '%'],
                        ['c.method', 'like', '%' . $search . '%'],
                        ['d.name', 'like', '%' . $search . '%']
                    ]
                ];
            } else {
                $conditions = [];
            }
            $params = [
                'table_name' => 'tbl_b_group_permissions',
                'connditions' => $conditions,
                'select' => [
                    'a.id', 'a.is_allowed', 'a.is_active',
                    'b.id AS group_id', 'b.name AS group_name',
                    'c.id AS permission_id', 'c.name AS permission_name', 'c.path', 'c.controller', 'c.method', 'c.is_basic', 'c.is_public', 'c.is_active AS permission_is_active',
                    'd.id AS module_id', 'd.name AS module_name'
                ],
                'join' => [
                    'leftJoin' => [
                        ['tbl_a_groups AS b', 'b.id', ' = ', 'a.group_id'],
                        ['tbl_a_permissions AS c', 'c.id', ' = ', 'a.permission_id'],
                        ['tbl_a_modules AS d', 'd.id', ' = ', 'a.module_id'],
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
                foreach ($data['data'] AS $keyword => $value) {
                    $is_allowed = '';
                    if ($value->is_allowed == 1) {
                        $is_allowed = ' checked';
                    }
                    $is_public = '';
                    if ($value->is_public == 1) {
                        $is_public = ' checked';
                    }
                    $is_basic = '';
                    if ($value->is_basic == 1) {
                        $is_basic = ' checked';
                    }
                    $is_permission_active = '';
                    if ($value->permission_is_active == 1) {
                        $is_permission_active = ' checked';
                    }
                    $arrData[] = [
                        'id' => $i,
                        'path' => $value->path,
                        'controller' => $value->controller,
                        'method' => $value->method,
                        'group_name' => $value->group_name,
                        'permission_name' => $value->permission_name,
                        'module_name' => $value->module_name,
                        'is_allowed' => '<input type = "checkbox"' . $is_allowed . ' name = "is_allowed" class = "make-switch" data-size = "small" data-id = "' . base64_encode($value->id) . '">',
                        'is_public' => '<input type = "checkbox"' . $is_public . ' name = "is_public" class = "make-switch" data-size = "small" data-id = "' . base64_encode($value->id) . '">',
                        'is_basic' => '<input type = "checkbox"' . $is_basic . ' name = "is_active" class = "make-switch" data-size = "small" data-id = "' . base64_encode($value->id) . '">',
                        'is_active' => '<input type = "checkbox"' . $is_permission_active . ' name = "is_permission_active" class = "make-switch" data-size = "small" data-id = "' . base64_encode($value->id) . '">'
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

    public function get_list_menu(Request $request) {
        if (isset($request) && !empty($request)) {
            $conditions = [];
            $draw = $request->draw;
            $limit = ($request->length) ? $request->length : 10;
            if ($request->length == '-1') {
                $limit = 1000;
            }
            $offset = ($request->start) ? $request->start : 0;
            $search = $request->search['value'];
            if (isset($search) && !empty($search)) {
                if (isset($request->type) && $request->type == 'basic') {
                    $conditions = [
                        'where' => [
                            ['a.is_basic', ' = ', 1]
                        ],
                        'orWhere' => [
                            ['a.name', 'like', '%' . $search . '%'],
                            ['a.path', 'like', '%' . $search . '%'],
                            ['a.controller', 'like', '%' . $search . '%'],
                            ['a.method', 'like', '%' . $search . '%']
                        ]
                    ];
                } else {
                    $conditions = [
                        'orWhere' => [
                            ['a.name', 'like', '%' . $search . '%'],
                            ['a.path', 'like', '%' . $search . '%'],
                            ['a.controller', 'like', '%' . $search . '%'],
                            ['a.method', 'like', '%' . $search . '%']
                        ]
                    ];
                }
            } else {
                if (isset($request->type) && $request->type == 'basic') {
                    $conditions = [
                        'where' => [
                            ['a.is_basic', ' = ', 1]
                        ]
                    ];
                } else {
                    $conditions = [];
                }
            }
            $params = [
                'table_name' => 'tbl_a_menus',
                'conditions' => $conditions,
                'order' => [
                    ['a.id', 'asc']
                ],
                'limit' => (int) $limit,
                'offset' => (int) $offset,
                'query_param' => config('app.url') . $request->getRequestUri()
            ];
            $data = $this->MY_Model->find($request, 'all', $params);
            if (isset($data) && !empty($data)) {
                $arrData = array();
                if ($offset == 0) {
                    $i = 1;
                } else {
                    $i = ($offset + 1);
                }
                foreach ($data['data'] AS $keyword => $value) {
                    $action = '<input type = "checkbox" name = "is_menu_allowed[]" class = "make-switch is_menu_allowed" data-size = "small" value = "' . base64_encode($value->id) . '">';
                    if (isset($request->type) && $request->type == 'basic') {
                        $action = '<input type = "checkbox" name = "is_menu_allowed[]" class = "make-switch is_menu_allowed" checked disabled data-size = "small" value = "' . base64_encode($value->id) . '">';
                    }
                    $arrData[] = [
                        'id' => $i,
                        'name' => $value->name,
                        'path' => $value->path,
                        'level' => $value->level,
                        'rank' => $value->rank,
                        'action' => $action
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

    public function get_list_permission(Request $request) {
        if (isset($request) && !empty($request)) {
            $conditions = [['a.is_active', '=', 1]];
            if (isset($request->type) && $request->type == 'basic') {
                $conditions = [['a.is_basic', '=', 1]];
            }
            $draw = $request['draw'];
            $start = (int) $request['start'];
            $length = $request['length'];
            $page = 1;
            if ($start > 0) {
                $r = ($start / $length);
                $page = $r + 1;
            }
            $limit = ($request->length) ? $request->length : 10;
            $offset = ($request->start) ? $request->start : 0;
            $search = $request['search']['value'];
            if (isset($search) && !empty($search)) {
                $dataSearch = [
                    'whereAndOr' => [
                        'and' => [
                            ['a.is_active', '=', 1]
                        ],
                        'or' => [
                            ['a.id', 'like', '%' . $search . '%'],
                            ['a.name', 'like', '%' . $search . '%'],
                        ]
                    ]
                ];
                //$data = DB::table('tbl_a_permissions AS a')
                //        ->where($conditions)
                //        ->where(function ($query) use ($search) {
                //            $query->where('a.id', 'like', '%' . $search . '%')->orWhere('a.name', 'like', '%' . $search . '%');
                //        })
                //        ->orderBy('a.id', 'ASC')
                //        ->offset($offset)
                //        ->limit($limit)
                //        ->get();
                //$total_rows = DB::table('tbl_a_permissions AS a')
                //        ->where($conditions)
                //        ->where(function ($query) use ($search) {
                //    $query->where('a.id', 'like', '%' . $search . '%')->orWhere('a.name', 'like', '%' . $search . '%');
                //});
            } else {
                $dataSearch = [
                    'where' => [
                        ['a.is_active', '=', 1]
                    ]
                ];
                //$data = DB::table('tbl_a_permissions AS a')
                //        ->where($conditions)
                //        ->orderBy('a.id', 'ASC')
                //        ->offset($offset)
                //        ->limit($limit)
                //        ->get();
                //$total_rows = DB::table('tbl_a_permissions AS a')->where($conditions)->count();
            }
            $param_groups = [
                'table_name' => 'tbl_a_permissions',
                'conditions' => $dataSearch,
                'limit' => $limit,
                'offset' => $offset,
                'order' => [
                    ['a.id', 'asc']
                ]
            ];
            $result = $this->MY_Model->find($request, 'all', $param_groups, 'mysql');
            if (isset($result['data']) && !empty($result['data'])) {
                $arr = array();
                foreach ($result['data'] AS $keyword => $value) {
                    $is_active = '';
                    if ($value->is_active == 1) {
                        $is_active = ' checked';
                    }
                    $action = '<input style="text-align:center" type="checkbox" name="is_permission_allowed[]" class="make-switch is_permission_allowed" data-size="small" value="' . base64_encode($value->id) . '">';
                    if (isset($request->type) && $request->type == 'basic') {
                        $action = '<input style="text-align:center" type="checkbox" name="is_permission_allowed[]" class="make-switch is_permission_allowed" checked disabled data-size="small" value="' . base64_encode($value->id) . '">';
                    }
                    $arr[] = [
                        'id' => $value->id,
                        'name' => $value->name,
                        'path' => $value->path,
                        'controller' => $value->controller,
                        'method' => $value->method,
                        'action' => $action
                    ];
                }
                $output = array(
                    'draw' => $draw,
                    'recordsTotal' => $result['meta']['total'],
                    'recordsFiltered' => $result['meta']['total'],
                    'data' => $arr,
                );
                echo json_encode($output);
            } else {
                echo json_encode(array());
            }
        } else {
            echo json_encode(array());
        }
    }

    public function get_list_user_permissions(Request $request) {
        if (isset($request) && !empty($request)) {
            $draw = $request->draw;
            $limit = ($request->length) ? $request->length : 10;
            $offset = ($request->start) ? $request->start : 0;
            $search = $request->search['value'];
            if (isset($search) && !empty($search)) {
                $conditions = [
                    'where' => [
                        ['b.user_id', '=', $this->__user_id],
                    ],
                    'orWhere' => [
                        ['a.name', 'like', '%' . $search . '%'],
                        ['a.path', 'like', '%' . $search . '%'],
                        ['a.controller', 'like', '%' . $search . '%'],
                        ['a.method', 'like', '%' . $search . '%']
                    ]
                ];
            } else {
                $conditions = [
                    'where' => [
                        ['b.user_id', '=', $this->__user_id],
                    ]
                ];
            }
            $params = [
                'table_name' => 'tbl_a_permissions',
                'select' => ['a.id', 'a.name', 'a.path', 'a.controller', 'a.method', 'a.is_basic AS permission_basic', 'a.is_public', 'a.is_basic', 'a.is_active AS permission_active', 'b.user_id', 'b.permission_id', 'b.is_denied', 'b.is_active'],
                'join' => [
                    'leftJoin' => [
                        ['tbl_b_user_permissions as b', 'b.permission_id', '=', 'a.id']
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
                    $is_public = '';
                    if ($value->is_public == 1) {
                        $is_public = ' checked';
                    }
                    $is_denied = '';
                    if ($value->is_denied == 1) {
                        $is_denied = ' checked';
                    }
                    $is_active = '';
                    if ($value->is_active == 1) {
                        $is_active = ' checked';
                    }
                    $arrData[] = [
                        'id' => $i,
                        'path' => $value->path,
                        'name' => $value->name,
                        'controller' => $value->controller,
                        'method' => $value->method,
                        'is_public' => '<input type="checkbox"' . $is_public . ' name="is_public" disabled class="make-switch" data-size="small">',
                        'is_denied' => '<input type="checkbox"' . $is_denied . ' name="is_denied" disabled class="make-switch" data-size="small">',
                        'is_active' => '<input type="checkbox"' . $is_active . ' name="is_active" disabled class="make-switch" data-size="small">',
                        'action' => '<a href="">Edit</a> | <a href="">Delete</a>'
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

    protected function getUserByMail($request, $data, $find = 'first') {
        $params = [
            'table_name' => 'tbl_a_users',
            'select' => [
                'id', 'user_name', 'first_name', 'last_name', 'email', 'profile_id'
            ],
            'conditions' => [
                'where' => [
                    ['a.email', '=', (string) base64_decode($data['detail']['email'])]
                ]
            ],
            'query_param' => config('app.url') . $request->getRequestUri()
        ];
        return $this->MY_Model->find($request, $find, $params);
    }

    protected function getUserById($request, $id, $find = 'first') {
        $params = [
            'table_name' => 'tbl_a_users',
            'conditions' => [
                'where' => [
                    ['a.id', ' = ', $id]
                ]
            ],
            'query_param' => config('app.url') . $request->getRequestUri()
        ];
        return $this->MY_Model->find($request, $find, $params);
    }

    public function insert(Request $request) {
        $data = $request->json()->all();
        $response = false;
        if (isset($data) && !empty($data)) {
            $user_exist = $this->getUserByMail($request, $data);
            if ($user_exist['data'] == null) {
                //insert user profile first
                $param_insert_user_profile = [
                    'address' => ($data['profile']['address']) ? (string) $data['profile']['address'] : '',
                    'zoom' => ($data['profile']['zoom']) ? (string) $data['profile']['zoom'] : '',
                    'lat' => ($data['profile']['lat']) ? (string) $data['profile']['lat'] : '',
                    'lng' => ($data['profile']['lng']) ? (string) $data['profile']['lng'] : '',
                    'facebook' => ($data['profile']['facebook']) ? (string) $data['profile']['facebook'] : '',
                    'twitter' => ($data['profile']['twitter']) ? (string) $data['profile']['twitter'] : '',
                    'instagram' => ($data['profile']['instagram']) ? (string) $data['profile']['instagram'] : '',
                    'linkedin' => ($data['profile']['linkedin']) ? (string) $data['profile']['linkedin'] : '',
                    'photo' => '-',
                    'last_education' => ($data['profile']['last_education']) ? (string) $data['profile']['last_education'] : '',
                    'last_education_institution' => ($data['profile']['last_education_institution']) ? (string) $data['profile']['last_education_institution'] : '',
                    'skill' => ($data['profile']['skill']) ? (string) $data['profile']['skill'] : '',
                    'notes' => ($data['profile']['notes']) ? (string) $data['profile']['notes'] : '',
                    'description' => $data['detail']['description'],
                    'is_active' => 1,
                    'created_by' => $this->__user_id,
                    'created_date' => $this->Date->now(),
                    'updated_by' => $this->__user_id,
                    'updated_date' => $this->Date->now()
                ];
                $user_profile_id = DB::table('tbl_a_user_profiles')->insertGetId($param_insert_user_profile);
                //insert into user
                $param_insert_user = [
                    'user_name' => ($data['detail']['user_name']) ? (string) $data['detail']['user_name'] : '-',
                    'first_name' => ($data['detail']['first_name']) ? (string) $data['detail']['first_name'] : '',
                    'last_name' => ($data['detail']['last_name']) ? (string) $data['detail']['last_name'] : '',
                    'password' => $this->TokenUser->__string_hash(base64_decode($data['detail']['password'])),
                    'salt' => '',
                    'email' => isset($data['detail']['email']) ? (string) base64_decode($data['detail']['email']) : '',
                    'description' => $data['detail']['description'],
                    'profile_id' => $user_profile_id,
                    'registered_type_id' => 1,
                    'is_active' => 1,
                    'created_by' => $this->__user_id,
                    'created_date' => $this->Date->now(),
                    'updated_by' => $this->__user_id,
                    'updated_date' => $this->Date->now()
                ];
                $user_id = DB::table('tbl_a_users')->insertGetId($param_insert_user);
                if ($user_id) {
                    //assign user group
                    $param_update_group_user = [
                        'user_id' => (int) $user_id,
                        'group_id' => (int) base64_decode($data['group']),
                        'is_active' => 1,
                        'created_by' => $this->__user_id,
                        'created_date' => $this->Date->now(),
                        'updated_by' => $this->__user_id,
                        'updated_date' => $this->Date->now()
                    ];
                    DB::table('tbl_b_user_groups')->insert($param_update_group_user);
                    //generate user permissions
                    $param_insert_user_permission = [];
                    if ($data['user_permissions_denied_all'] == true) {
                        $param_permissions = [
                            'table_name' => 'tbl_a_permissions'
                        ];
                        $permissions = $this->MY_Model->find($request, 'all', $param_permissions);
                        foreach ($permissions['data'] AS $key => $value) {
                            $param_insert_user_permission[] = [
                                'user_id' => (int) $user_id,
                                'permission_id' => (int) $value->id,
                                'is_denied' => 1,
                                'is_active' => 1,
                                'created_by' => $this->__user_id,
                                'created_date' => $this->Date->now(),
                                'updated_by' => $this->__user_id,
                                'updated_date' => $this->Date->now()
                            ];
                        }
                    } else {
                        $data['user_permissions_denied'];
                        foreach ($data['user_permissions_denied'] AS $key => $value) {
                            $param_insert_user_permission[] = [
                                'user_id' => (int) $user_id,
                                'permission_id' => (int) $value,
                                'is_denied' => 1,
                                'is_active' => 1,
                                'created_by' => $this->__user_id,
                                'created_date' => $this->Date->now(),
                                'updated_by' => $this->__user_id,
                                'updated_date' => $this->Date->now()
                            ];
                        }
                    }
                    $response = DB::table('tbl_b_user_permissions')->insert($param_insert_user_permission);
                    if ($response == true) {
                        return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully generate user.', 'valid' => true]);
                    } else {
                        return $this->MyHelper->_set_response('json', ['code' => 500, 'message' => 'failed generate user.1', 'valid' => false]);
                    }
                } else {
                    return $this->MyHelper->_set_response('json', ['code' => 500, 'message' => 'failed generate user.2', 'valid' => false]);
                }
            } else {
                return $this->MyHelper->_set_response('json', ['code' => 500, 'message' => 'failed generate user, user exist.', 'valid' => false]);
            }
        }
    }

    public function update(Request $request, $pr_id = null) {
        switch ($request->a) {
            case 1:
                return $this->submit_update_user($request);
                break;
            case 2:
                return $this->submit_update_prefference($request);
                break;
            case 3:
                return $this->submit_update_permission($request);
                break;
            default:
                return $this->submit_form($request, $pr_id);
                break;
        }
    }

    protected function submit_form($request, $pr_id) {
        $data = $request->json()->all();
        if (isset($data) && !empty($data)) {
            $id = (int) base64_decode($pr_id);
            if ($id == 1 && $id == 2) {
                return $this->MyHelper->_set_response('json', ['code' => 500, 'message' => 'Failed update user, this is special user cannot delete or update any credential data user.', 'valid' => true]);
            }
            $param_update = [
                'user_name' => ($data['user_name']) ? (string) $data['user_name'] : '-',
                'last_name' => ($data['last_name']) ? (string) $data['last_name'] : '',
                'first_name' => ($data['first_name']) ? (string) $data['first_name'] : '',
                'description' => ($data['description']) ? (string) $data['description'] : '',
                'updated_by' => $this->__user_id,
                'updated_date' => $this->Date->now()
            ];
            $result = DB::table('tbl_a_users')->where('id', $id)->update($param_update);
            if ($result) {
                $param_usergroup_exist = [
                    'table_name' => 'tbl_b_user_groups',
                    'conditions' => [
                        'where' => [
                            ['a.id', '=', (int) ($data['user_group_id'])]
                        ]
                    ]
                ];
                $user_group_exist = $this->MY_Model->find($request, 'first', $param_usergroup_exist);
                if ($user_group_exist['data'] == null) {
                    $param_update_group = [
                        'user_id' => (int) $id,
                        'group_id' => (int) $data['group_id'],
                        'created_by' => $this->__user_id,
                        'created_date' => $this->Date->now(),
                        'updated_by' => $this->__user_id,
                        'updated_date' => $this->Date->now()
                    ];
                    DB::table('tbl_b_user_groups')->insert($param_update_group);
                } else {
                    $param_update_group = [
                        'group_id' => (int) $data['group_id'],
                        'updated_by' => $this->__user_id,
                        'updated_date' => $this->Date->now()
                    ];
                    DB::table('tbl_b_user_groups')->where('id', (int) ($data['user_group_id']))->update($param_update_group);
                }
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully update user.', 'valid' => true]);
            } else {
                return $this->MyHelper->_set_response('json', ['code' => 500, 'message' => 'failed update user.', 'valid' => false]);
            }
        }
    }

    protected function submit_update_user($request) {
        $data = $request->json()->all();
        if (isset($data) && !empty($data)) {
            $param_update_profile = [
                'user_name' => (string) $data['user_name'],
                'first_name' => (string) $data['first_name'],
                'last_name' => (string) $data['last_name']
            ];
            DB::table('tbl_a_users')->where('id', $this->__user_id)->update($param_update_profile);
            if ($data['is_change_pass'] == true) {
                $user = DB::table('tbl_a_users AS a')->select('a.id', 'a.user_name', 'a.email', 'a.password')->where('a.id', ' = ', $this->__user_id)->first();
                if (isset($user) && !empty($user)) {
                    $verify_hash = $this->TokenUser->__verify_hash(base64_decode($data['old_pass']), $user->password);
                    if ($verify_hash == true) {
                        $hashed_new_pass = $this->TokenUser->__string_hash(base64_decode($data['new_pass1']));
                        DB::table('tbl_a_users')->where('id', $this->__user_id)->update([
                            'password' => $hashed_new_pass
                        ]);
                    }
                }
            }
            return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully update user profile.', 'valid' => true]);
        }
    }

    protected function submit_update_prefference($request) {
        $data = $request->json()->all();
        if (isset($data) && !empty($data)) {
            $user = DB::table('tbl_a_users AS a')->select('a.id', 'a.profile_id')->where('a.id', ' = ', $this->__user_id)->first();
            if ($user->profile_id != 0) {
                $param_update_profile = [
                    'address' => ($data['address']) ? (string) $data['address'] : '',
                    'zoom' => ($data['zoom']) ? (string) $data['zoom'] : '',
                    'lat' => ($data['lat']) ? (string) $data['lat'] : '',
                    'lng' => ($data['lng']) ? (string) $data['lng'] : '',
                    'facebook' => ($data['facebook']) ? (string) $data['facebook'] : '',
                    'twitter' => ($data['twitter']) ? (string) $data['twitter'] : '',
                    'instagram' => ($data['instagram']) ? (string) $data['instagram'] : '',
                    'linkedin' => ($data['linkedin']) ? (string) $data['linkedin'] : '',
                    'last_education' => ($data['last_education']) ? (string) $data['last_education'] : '',
                    'last_education_institution' => ($data['last_education_institution']) ? (string) $data['last_education_institution'] : '',
                    'skill' => ($data['skill']) ? (string) $data['skill'] : '',
                    'notes' => ($data['notes']) ? (string) $data['notes'] : '',
                    'updated_by' => $this->__user_id,
                    'updated_date' => $this->Date->now()
                ];
                DB::table('tbl_a_user_profiles')->where('id', $user->profile_id)->update($param_update_profile);
            } else {
                $param_update_profile = [
                    'address' => ($data['address']) ? (string) $data['address'] : '',
                    'zoom' => ($data['zoom']) ? (string) $data['zoom'] : '',
                    'lat' => ($data['lat']) ? (string) $data['lat'] : '',
                    'lng' => ($data['lng']) ? (string) $data['lng'] : '',
                    'facebook' => ($data['facebook']) ? (string) $data['facebook'] : '',
                    'twitter' => ($data['twitter']) ? (string) $data['twitter'] : '',
                    'instagram' => ($data['instagram']) ? (string) $data['instagram'] : '',
                    'linkedin' => ($data['linkedin']) ? (string) $data['linkedin'] : '',
                    'photo' => '-',
                    'last_education' => ($data['last_education']) ? (string) $data['last_education'] : '',
                    'last_education_institution' => ($data['last_education_institution']) ? (string) $data['last_education_institution'] : '',
                    'skill' => ($data['skill']) ? (string) $data['skill'] : '',
                    'notes' => ($data['notes']) ? (string) $data['notes'] : '',
                    'description' => '-',
                    'is_active' => 1,
                    'created_by' => $this->__user_id,
                    'created_date' => $this->Date->now(),
                    'updated_by' => $this->__user_id,
                    'updated_date' => $this->Date->now()
                ];
                $profileID = DB::table('tbl_a_user_profiles')->insertGetId($param_update_profile);
                DB::table('tbl_a_users')->where('id', $user->id)->update(['profile_id' => $profileID]);
            }
            return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully update user profile.', 'valid' => true]);
        }
    }

    protected function submit_update_permission($request) {
        $data = $request->json()->all();
        if (isset($data) && !empty($data)) {
            if ($data['permission']) {
                $param_group_permission = [];
                foreach ($data['permission'] AS $keyword => $value) {
                    $param_group_permission[] = [
                        'group_id' => $this->__group_id,
                        'permission_id' => (int) $value,
                        'module_id' => (int) $data['module'],
                        'is_allowed' => ($data['is_allowed'] == true) ? 1 : 0,
                        'is_active' => ($data['is_active'] == true) ? 1 : 0,
                        'created_by' => $this->__user_id,
                        'created_date' => $this->Date->now(),
                        'updated_by' => $this->__user_id,
                        'updated_date' => $this->Date->now(),
                    ];
                }
                $result = DB::table('tbl_b_group_permissions')->insert($param_group_permission);
            }
            if ($result) {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully update user profile.', 'valid' => true]);
            } else {
                return $this->MyHelper->_set_response('json', ['code' => 500, 'message' => 'Failed insert new permission data.', 'valid' => false]);
            }
        } else {
            return $this->MyHelper->_set_response('json', ['code' => 500, 'message' => 'Failed insert new permission data.', 'valid' => false]);
        }
    }

    public function view_auth(Request $request) {
        $title_for_layout = config('app.default_variables.title_for_layout');
        $_breadcrumb = [
            [
                'id' => 1,
                'title' => 'Dashboard',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri')
            ],
            [
                'id' => 2,
                'title' => 'Group Permission',
                'icon' => '',
                'arrow' => false,
                'path' => config('app.base_extraweb_uri') . '/master/group_user/view'
            ]
        ];
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumb'));
    }

    public function insert_auth(Request $request) {
        $data = $request->json()->all();
        $response = false;
        if (isset($data) && !empty($data)) {
            if (isset($data['group_id']) && !empty($data['group_id'])) {
                $group = [];
                $is_ok = [];
                sort($data['user_id']);
                foreach ($data['group_id'] AS $keyword => $value) {
                    $user_id = [];
                    foreach ($data['user_id'] AS $key => $val) {
                        $user_id[] = [
                            'group_id' => (int) $value,
                            'user_id' => (int) $val,
                            'is_public' => $data['is_public'],
                            'is_allowed' => $data['is_allowed'],
                            'is_active' => $data['is_active'],
                            'created_by' => isset($data['created_by']) ? $data['created_by'] : $this->__user_id,
                            'created_date' => isset($data['created_date']) ? $data['created_date'] : date('Y-m-d H:i:s'),
                            'updated_by' => isset($data['created_by']) ? $data['created_by'] : $this->__user_id,
                            'updated_date' => isset($data['created_date']) ? $data['created_date'] : date('Y-m-d H:i:s')
                        ];
                    }
                    $response = DB::table('tbl_b_group_permissions')->insert($user_id);
                    if ($response) {
                        $is_ok[] = [1];
                    }
                }
            }
            if ($is_ok == 1) {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully insert data', 'valid' => true]);
            } else {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'failed insert data.', 'valid' => false]);
            }
        }
    }

    public function update_auth(Request $request, $pr_id = null) {
        $data = $request->json()->all();
        if (isset($data) && !empty($data)) {
            $id = base64_decode($pr_id);
            switch ($data['action']) {
                case 'is_active':
                    $update_data = [
                        'is_active' => $data['is_active'],
                        'updated_by' => isset($data['created_by']) ? $data['created_by'] : $this->__user_id,
                        'updated_date' => isset($data['created_date']) ? $data['created_date'] : date('Y-m-d H:i:s')
                    ];
                    break;
                default:
                    $update_data = [
                        'title' => $data['title'],
                        'path' => $data['path'],
                        'controller' => $data['controller'],
                        'method' => $data['method'],
                        'module_id' => $data['module_id'],
                        'description' => $data['description'],
                        'is_active' => isset($data['is_active']) ? 1 : 0,
                        'updated_by' => isset($data['created_by']) ? $data['created_by'] : $this->__user_id,
                        'updated_date' => isset($data['created_date']) ? $data['created_date'] : date('Y-m-d H:i:s')
                    ];
                    break;
            }
            $response = DB::table('tbl_b_group_permissions')->where('id', ' = ', (int) $id)->update($update_data);
            if ($response) {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully update data', 'valid' => true]);
            } else {
                return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'failed update data.', 'valid' => false]);
            }
        }
    }

    public function view_group(Request $request) {
        $title_for_layout = config('app.default_variables.title_for_layout');
        $_breadcrumb = [
            [
                'id' => 1,
                'title' => 'Dashboard',
                'icon' => '',
                'arrow' => true,
                'path' => config('app.base_extraweb_uri')
            ],
            [
                'id' => 2,
                'title' => 'User Permission',
                'icon' => '',
                'arrow' => false,
                'path' => config('app.base_extraweb_uri') . '/master/user/view'
            ]
        ];
        $_config = [
            'title_for_header' => '<b>User Groups</b> master data management page',
            'create_page' => [
                'title' => 'click to open form create new user group',
                'icon' => '<i class = "fas fa-square-plus"></i>',
                'link' => config('app.base_extraweb_uri') . '/master/user/groups/create'
            ]
        ];
        return view('Public_html.Layouts.Adminlte.dashboard', compact('title_for_layout', '_breadcrumb', '_config'));
    }

}
