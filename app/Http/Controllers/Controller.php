<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
//use App\Http\Middleware\GenerateDummy;
use App\Helpers\MyHelper;
use App\Helpers\Oreno\Date;
use App\Models\MY_Model;
use App\Models\Tables\Core\Tbl_a_menus;
use App\Models\Tables\Core\Tbl_a_users;
use App\Models\Tables\Core\Tbl_a_user_menu_master;
use App\Models\Tables\Core\Tbl_d_logs;
use App\Models\Tables\Core\Tbl_a_modules;
use View;

class Controller extends BaseController {

    use AuthorizesRequests,
        DispatchesJobs,
        ValidatesRequests;

    protected $table_default = 'tbl_logs';
    protected $MyHelper;
    protected $Date;
    protected $MY_Model;
    protected $Tbl_a_modules;
    protected $Tbl_a_users;
    protected $Tbl_d_logs;
    protected $Tbl_a_menus;

    public function __construct(Request $request) {
        $this->MY_Model = new MY_Model;
        $this->Date = new Date;
        $this->MyHelper = new MyHelper;
        $this->Tbl_a_modules = new Tbl_a_modules;
        $this->Tbl_a_users = new Tbl_a_users;
        $this->Tbl_d_logs = new Tbl_d_logs;
        $this->Tbl_a_menus = new Tbl_a_menus;
        //$this->GenerateDummy = new GenerateDummy;
        //dd($this->GenerateDummy->generate_user($request));
        $data = $request->session()->all();
        if (isset($data['_session_is_logged_in']) && !empty($data['_session_is_logged_in']) && $data['_session_is_logged_in'] == true) {
            $this->__is_logged_in = $data['_session_is_logged_in'];
            View::share('__is_logged_in', $data['_session_is_logged_in']);
            $this->__user_id = $data['_session_user_id'];
            View::share('__user_id', $data['_session_user_id']);
            $this->__group_id = $data['_session_group_id'];
            View::share('__group_id', $data['_session_group_id']);
            $this->__user_name = $data['_session_user_name'];
            View::share('__user_name', $data['_session_user_name']);
            $this->__user_email = $data['_session_user_email'];
            View::share('__user_email', $data['_session_user_email']);

            $this->_init_navbar_notif($request);
        }
        $this->_init_global_var($request);
    }

    public function load_css($class = array()) {
        if ($class) {
            View::share('load_css', $class);
        }
    }

    public function load_js($class = array()) {
        if ($class) {
            View::share('load_js', $class);
        }
    }

    public function load_ajax_var($values = array()) {
        if ($values) {
            View::share('load_ajax_var', $values);
        }
    }

    public function replace_namespace($namespace) {
        //$path_without_namespace = str_replace($namespace, '', $routeArray['uses']);
        $path_without_namespace = str_replace("App", '', $namespace);
        $path_without_namespace = str_replace("\Http", '', $path_without_namespace);
        $path_without_namespace = str_replace("\Controllers\\", '', $path_without_namespace);
        return $path_without_namespace;
    }

    public function _init_global_var($request) {
        if (!$request->session()->get('_uuid') || $request->session()->get('_uuid') == null) {
            $request->session()->put('_uuid', uniqid());
        }
        View::share('_uuid', $request->session()->get('_uuid'));
        //init date now
        View::share('_date_now', $this->Date->indonesian_format('l, j F Y H:i'));
        //env
        View::share('_env', config('app.env'));

        //init days name
        $days_name = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
        $this->days_name = $days_name;
        View::share('_days_name', $days_name);

        //init month name
        $month_name = [1 => 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', ' Desember'];
        $this->month_name = $month_name;
        View::share('_months_name', $month_name);

        //init global js
        $path_app_global_js = 'Public_html.Helpers.global_js';
        View::share('_path_app_global_js', $path_app_global_js);

        //init class & method name
        $class_name = str_replace('Controller', '', $this->MyHelper->getRoutes('controller'));
        $method_name = $this->MyHelper->getRoutes('action');

        $routeArray = app('request')->route()->getAction();
        $namespace = $routeArray['namespace'];
        $path_without_namespace = str_replace($namespace, '', $routeArray['uses']);
        $path_without_namespace = $this->replace_namespace($path_without_namespace);
        //$path = str_replace('\\', '.', $path_without_namespace);
        $path_ = explode('\\', $path_without_namespace);
        $controller_path = '';
        $modul = $path_[0];
        $total_namespace = count($path_) - 1;
        for ($i = 0; $i < $total_namespace; $i++) {
            if (isset($controller_path))
                $controller_path .= '.';

            $controller_path .= $path_[$i];
        }
        //$controller_path = $path_[3]; // str_replace($controller, '', $path);
        $controller = $class_name . 'Controller@' . $method_name;
        $views = array(
            'class' => $class_name,
            'method' => $method_name,
            'html' => 'Public_html.Pages' . $controller_path . '.' . $class_name . '.' . $method_name . '_html',
            'js' => 'Public_html.Pages' . $controller_path . '.' . $class_name . '.' . $method_name . '_js'
        );
        View::share('_default_views', $views);
        $arr_nav_menu = [
            [
                'id' => 1,
                'title' => 'Profile',
                'key' => 'profile',
                'path' => config('app.base_extraweb_uri') . '/profile'
            ],
        ];
        $default_layout = 'sidebar-collapse layout-fixed'; //'layout-navbar-fixed'; //'layout-fixed';
        View::share('default_layout', $default_layout);
        View::share('_menu_navigation', json_decode(json_encode($arr_nav_menu)));
        $user_detail_date = $user_log_date = '';
        if (isset($this->__user_id) && !empty($this->__user_id)) {
            $user_detail = $this->Tbl_a_users->get_by_id($request, $this->__user_id)['data'];
            if ($user_detail != null) {
                $user_detail_date = $this->Date->diff($this->Date->now(), $user_detail->updated_date, false, true);
                $user_log = $this->Tbl_d_logs->get_by($request, array(
                            'conditions' => [
                                ['created_by', '=', $this->__user_id],
                                ['is_active', '=', 1]
                            ],
                            'order' => ['created_date', 'desc']
                                )
                        )['data'];
                if ($user_log) {
                    $user_log_date = $this->Date->diff($this->Date->now(), $user_log->updated_date, false, true);
                }
            }
        }
        $_menu_profiles = [
            [
                'id' => 1,
                'title' => 'Profile',
                'key' => 'profile',
                'info' => $user_detail_date,
                'path' => config('app.base_extraweb_uri') . '/profile'
            ],
            [
                'id' => 2,
                'title' => 'Activity Logs',
                'key' => 'logs',
                'info' => $user_log_date,
                'path' => config('app.base_extraweb_uri') . '/logs'
            ],
            [
                'id' => 3,
                'title' => 'Logout',
                'key' => 'logout',
                'info' => '',
                'path' => config('app.base_extraweb_uri') . '/logout'
            ]
        ];
        View::share('_menu_profiles', json_decode(json_encode($_menu_profiles)));
        $arr_breadcrumbs = [
            [
                'id' => 1,
                'title' => 'Dashboard',
                'icon' => '',
                'arrow' => false,
                'path' => config('app.url')
            ]
        ];
        View::share('_breadcrumbs', $arr_breadcrumbs);
        $module_id = 3;
        $current_module = $this->Tbl_a_modules->get_data_by_alias($request, strtolower($modul))['data'];
        if ($current_module) {
            $module_id = $current_module->id;
        }
        View::share('__module_id', $module_id);
        if (isset($this->__user_id) && !empty($this->__user_id)) {
            $sidebar_menu = $this->Tbl_a_menus->get_tree_menu($request, $this->__group_id, $module_id);
            if (isset($sidebar_menu) && !empty($sidebar_menu)) {
                View::share('_sidebar_menu', json_decode(json_encode($sidebar_menu)));
            }
        }
        //insert into logs
        $fraud_scan = 'guest user access page with class ' . $class_name . ' and method ' . $method_name . ' at ' . $this->Date->now();
        $user_id = 1;
        if (isset($this->__user_id) && !empty($this->__user_id)) {
            $fraud_scan = 'User ' . $this->__user_name . ' do access page with class ' . $class_name . ' and method ' . $method_name . ' at ' . $this->Date->now();
            $user_id = $this->__user_id;
        }
        $create_logs = [
            'fraud_scan' => $fraud_scan,
            'ip_address' => $this->MyHelper->getIp(),
            'browser' => json_encode($this->MyHelper->getBrowser()),
            'class' => $class_name,
            'method' => $method_name,
            'event' => $request->method(),
            'is_active' => 1,
            'created_by' => $user_id,
            'created_date' => $this->Date->now(),
            'updated_by' => $user_id,
            'updated_date' => $this->Date->now()
        ];
        //$this->Tbl_d_logs->do_insert($request, $create_logs);
    }

    protected function fnGetAttachmentFiles($request, $id) {
        $paramsAttachment = [
            'table_name' => 'tbl_e_message_attachments',
            'conditions' => [
                'where' => [
                    ['a.mail_id', '=', $id]
                ]
            ],
            'order' => [
                ['a.title', 'asc']
            ]
        ];
        return $this->MY_Model->find($request, 'all', $paramsAttachment);
    }

    protected function fnGetInboxMailTotal($request, $user_id, $mailto, $is_total = true) {
        $conditions = [
            ['a.mail_from', '=', $user_id]
        ];
        if ($mailto == true) {
            $conditions = [
                ['a.mail_to', '=', $user_id]
            ];
        }
        $whereAdd = [
            ['b.is_mail', '=', 1],
            ['b.is_chat', '=', 0],
            ['b.is_draft', '=', 0],
            ['b.is_junk', '=', 0],
            ['b.is_trash', '=', 0]
        ];
        $mixCond = array('where' => array_merge($conditions, $whereAdd));
        $params = [
            'table_name' => 'tbl_e_message_send',
            'select' => [
                'a.*',
                'b.code AS message_code', 'b.subject AS message_subject', 'b.text', 'b.is_active AS message_active', 'b.is_chat', 'b.is_mail', 'b.is_draft', 'b.is_junk', 'b.is_trash',
                'c.id AS user_id', 'c.user_name', 'c.email',
                'd.id AS user_porifle_id', 'd.photo'
            ],
            'join' => [
                'leftJoin' => [
                    ['tbl_e_messages AS b', 'b.id', '=', 'a.mail_id'],
                    ['tbl_a_users AS c', 'c.id', '=', 'a.mail_to'],
                    ['tbl_a_user_profiles AS d', 'd.id', '=', 'c.profile_id']
                ],
            ],
            'conditions' => $mixCond,
            'order' => [
                ['a.id', 'asc']
            ],
            'query_param' => config('app.url') . $request->getRequestUri()
        ];
        $data = $this->MY_Model->find($request, 'all', $params);
        if ($is_total == true) {
            return $data['meta']['total'];
        } else {
            $arrData = [];
            foreach ($data['data'] AS $k => $v) {
                $arrData[] = [
                    'id' => base64_encode($v->id),
                    'username' => $v->email,
                    'message' => substr($v->text, 0, 15),
                    'time' => $this->MyHelper->fnDateDiff($this->Date->now(), $v->updated_date, false, true)
                ];
            }
            return $arrData;
        }
    }

    protected function fnGetInboxMailJunkTotal($request, $user_id, $is_total = true) {
        $params = [
            'table_name' => 'tbl_e_message_send',
            'join' => [
                'leftJoin' => [
                    ['tbl_e_messages AS b', 'b.id', '=', 'a.mail_id'],
                    ['tbl_a_users AS c', 'c.id', '=', 'a.mail_from'],
                    ['tbl_a_user_profiles AS d', 'd.id', '=', 'c.profile_id']
                ],
            ],
            'conditions' => [
                'where' => [
                    ['a.mail_from', '=', $user_id],
                    ['b.is_junk', '=', 1]
                ]
            ],
            'order' => [
                ['a.id', 'asc']
            ],
            'query_param' => config('app.url') . $request->getRequestUri()
        ];
        $data = $this->MY_Model->find($request, 'all', $params);
        if ($is_total == true) {
            return $data['meta']['total'];
        } else {
            return $data['data'];
        }
    }

    protected function fnGetInboxMailDraftTotal($request, $user_id, $is_total = true) {
        $params = [
            'table_name' => 'tbl_e_message_send',
            'join' => [
                'leftJoin' => [
                    ['tbl_e_messages AS b', 'b.id', '=', 'a.mail_id'],
                    ['tbl_a_users AS c', 'c.id', '=', 'a.mail_from'],
                    ['tbl_a_user_profiles AS d', 'd.id', '=', 'c.profile_id']
                ],
            ],
            'conditions' => [
                'where' => [
                    ['a.mail_from', '=', $user_id],
                    ['b.is_draft', '=', 1]
                ]
            ],
            'order' => [
                ['a.id', 'asc']
            ],
            'query_param' => config('app.url') . $request->getRequestUri()
        ];
        $data = $this->MY_Model->find($request, 'all', $params);
        if ($is_total == true) {
            return $data['meta']['total'];
        } else {
            return $data['data'];
        }
    }

    protected function fnGetInboxMailTrashTotal($request, $user_id, $is_total = true) {
        $params = [
            'table_name' => 'tbl_e_message_send',
            'join' => [
                'leftJoin' => [
                    ['tbl_e_messages AS b', 'b.id', '=', 'a.mail_id'],
                    ['tbl_a_users AS c', 'c.id', '=', 'a.mail_from'],
                    ['tbl_a_user_profiles AS d', 'd.id', '=', 'c.profile_id']
                ],
            ],
            'conditions' => [
                'where' => [
                    ['a.mail_from', '=', $user_id],
                    ['b.is_trash', '=', 1]
                ]
            ],
            'order' => [
                ['a.id', 'asc']
            ],
            'query_param' => config('app.url') . $request->getRequestUri()
        ];
        $data = $this->MY_Model->find($request, 'all', $params);
        if ($is_total == true) {
            return $data['meta']['total'];
        } else {
            return $data['data'];
        }
    }

    protected function fnGetInboxChatTotal($request, $user_id, $is_total = true) {
        $params = [
            'table_name' => 'tbl_e_message_send',
            'select' => [
                'a.*',
                'b.code AS message_code', 'b.subject AS message_subject', 'b.text', 'b.is_active AS message_active', 'b.is_chat', 'b.is_mail', 'b.is_draft', 'b.is_junk', 'b.is_trash',
                'c.id AS user_id', 'c.user_name', 'c.email',
                'd.id AS user_porifle_id', 'd.photo'
            ],
            'join' => [
                'leftJoin' => [
                    ['tbl_e_messages AS b', 'b.id', '=', 'a.mail_id'],
                    ['tbl_a_users AS c', 'c.id', '=', 'a.mail_from'],
                    ['tbl_a_user_profiles AS d', 'd.id', '=', 'c.profile_id']
                ],
            ],
            'conditions' => [
                'where' => [
                    ['a.mail_to', '=', $user_id],
                    ['b.is_chat', '=', 1],
                    ['b.is_mail', '=', 0],
                    ['b.is_draft', '=', 0],
                    ['b.is_junk', '=', 0],
                    ['b.is_trash', '=', 0]
                ]
            ],
            'order' => [
                ['a.id', 'asc']
            ],
            'query_param' => config('app.url') . $request->getRequestUri()
        ];
        $data = $this->MY_Model->find($request, 'all', $params);
        if ($is_total == true) {
            return $data['meta']['total'];
        } else {
            $arrData = [];
            foreach ($data['data'] AS $k => $v) {
                $arrData[] = [
                    'id' => base64_encode($v->id),
                    'photo' => config('app.base_media_uri') . $v->photo,
                    'username' => $v->email,
                    'message' => substr($v->text, 0, 15),
                    'time' => $this->MyHelper->fnDateDiff($this->Date->now(), $v->updated_date, false, true)
                ];
            }
            return $arrData;
        }
    }

    protected function _init_navbar_notif($request, $is_ajax = false) {
        $total_chat = $this->fnGetInboxChatTotal($request, $this->__user_id, true);
        $msg_chat = $this->fnGetInboxChatTotal($request, $this->__user_id, false);

        $total_inbox = $this->fnGetInboxMailTotal($request, $this->__user_id, true);
        $msg_inbox = $this->fnGetInboxMailTotal($request, $this->__user_id, true, false);
        $data = array(
            'total_chat' => $total_chat,
            'msg_chat' => $msg_chat,
            'total_inbox' => $total_inbox,
            'msg_inbox' => $msg_inbox,
        );
        if ($is_ajax == true) {
            return $data;
        } else {
            foreach ($data AS $key => $value) {
                View::share($key, $value);
            }
        }
    }

    protected function _init_notif($request) {
        $total_sent = $this->fnGetInboxMailTotal($request, $this->__user_id, false);
        $msg_sent = $this->fnGetInboxMailTotal($request, $this->__user_id, false, false);

        $total_draft = $this->fnGetInboxMailDraftTotal($request, $this->__user_id, true);
        $msg_draft = $this->fnGetInboxMailDraftTotal($request, $this->__user_id, false);

        $total_junk = $this->fnGetInboxMailJunkTotal($request, $this->__user_id, true);
        $msg_junk = $this->fnGetInboxMailJunkTotal($request, $this->__user_id, false);

        $total_trash = $this->fnGetInboxMailTrashTotal($request, $this->__user_id, true);
        $msg_trash = $this->fnGetInboxMailTrashTotal($request, $this->__user_id, false);
        $data = array(
            'total_sent' => $total_sent,
            'msg_sent' => $msg_sent,
            'total_draft' => $total_draft,
            'msg_draft' => $msg_draft,
            'total_junk' => $total_junk,
            'msg_junk' => $msg_junk,
            'total_trash' => $total_trash,
            'msg_trash' => $msg_trash
        );
        foreach ($data AS $key => $value) {
            View::share($key, $value);
        }
    }

    protected function get_group_permissions($request, $id) {
        $params = [
            'table_name' => 'tbl_b_group_permissions',
            'conditions' => [
                'where' => [
                    ['a.group_id', '=', $id]
                ]
            ],
            'order' => [
                ['a.id', 'asc']
            ]
        ];
        return $this->MY_Model->find($request, 'all', $params);
    }

    protected function getTeamUserById($request, $id = array(), $find = 'all') {
        $teamUser = [];
        if ($id) {
            $paramTeam = [
                'table_name' => 'tbl_a_project_team_users',
                'select' => [
                    'a.*',
                    'b.id AS project_team_id', 'b.name AS project_team_name'
                ],
                'conditions' => [
                    'whereIn' => [
                        ['a.team_id', $id]
                    ]
                ],
                'join' => [
                    'leftJoin' => [
                        ['tbl_a_project_teams AS b', 'b.id', '=', 'a.team_id']
                    ]
                ],
                'order' => [
                    ['a.email_address', 'asc']
                ]
            ];
            $teamUser = $this->MY_Model->find($request, $find, $paramTeam, 'mysql_assessment');
        }
        return $teamUser;
    }

    protected function getTeamUserByTeam_user_id($request, $id) {
        $teamUser = [];
        if ($id) {
            $paramTeam = [
                'table_name' => 'tbl_a_project_team_users',
                'conditions' => [
                    'where' => [
                        ['a.id', '=', $id]
                    ]
                ]
            ];
            $teamUser = $this->MY_Model->find($request, 'first', $paramTeam, 'mysql_assessment');
        }
        return $teamUser['data']->team_id;
    }

}
