<?php

namespace App\Http\Middleware;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use App\Helpers\MyHelper;
use App\Http\Middleware\TokenUser;
use App\Helpers\Oreno\Date;
use App\Helpers\Oreno\Jwt;
use App\Helpers\Oreno\Converter;
use App\Helpers\Oreno\Cookie;
use App\Models\MY_Model;
use Closure;

class Authenticate {

    protected $MY_Model;
    protected $MyHelper;
    protected $TokenUser;
    protected $Jwt;
    protected $Date;
    protected $Cookie;
    protected $Converter;

    public function __construct() {
        $this->MY_Model = new MY_Model();
        $this->MyHelper = new MyHelper();
        $this->TokenUser = new TokenUser();
        $this->Jwt = new Jwt();
        $this->Date = new Date();
        $this->Cookie = new Cookie();
        $this->Converter = new Converter();
    }

    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    protected function redirectTo($request) {
        if (!$request->expectsJson()) {
            return route('login');
        }
    }

    public function handle(Request $request, Closure $next) {
        $currentPath = Route::getFacadeRoot()->current()->uri();
        $param_cookies = [
            'name' => 'is_first_load',
            'value' => true,
            'minutes' => 86400,
            'path' => url()->full()
        ];
        $this->Cookie->create($request, $param_cookies);
        $curr_cookie = $this->Cookie->get($request, $param_cookies);
        $authAccessServices = $this->initServices($request, $currentPath);
        if ($authAccessServices && $authAccessServices['is_valid'] == true) {
            return $next($request);
        } else {
            if ($request->ajax()) {
                $response_data = array('status' => 401, 'message' => 'This url need login session to accessed');
                return response()->json($response_data, 401);
            } else {
                if ($currentPath != 'extraweb/login') {
                    session(['_session_destination_path' => '/' . $currentPath]);
                    session()->save();
                }
                return redirect('/extraweb/login')->with(['warning-msg' => 'This page need login session, please login first!']);
            }
        }
    }

    protected function initServices($request, $currentPath) {
        $response = false;
        //get permission by url request from routes 
        $paramsCurrentPermission = [
            'table_name' => 'tbl_a_permissions',
            'select' => ['id', 'name', 'path', 'controller', 'method', 'is_public', 'is_basic', 'is_active'],
            'conditions' => [
                'where' => [
                    ['a.path', 'like', '%' . $currentPath . '%']
                ]
            ]
        ];
        $currentPermission = $this->MY_Model->find($request, 'all', $paramsCurrentPermission);
        if ($currentPermission['data'] == null || empty($currentPermission['data']) || $currentPermission['meta']['total'] == 0) {
            $response = false;
            $url = '/extraweb/login';
        } else {
            //get group and group permissions
            $data = $request->session()->all();
            $currentPermissionData = $currentPermission['data'][0];
            if ($currentPermission['meta']['total'] > 1) {
                foreach ($currentPermission['data'] AS $keyword => $value) {
                    if ($value->method == 'view') {
                        $currentPermissionData = $currentPermission['data'][$keyword];
                    }
                }
            }
            $currentPermission = $currentPermissionData;
            if (isset($data['_session_is_logged_in']) == false || $data['_session_is_logged_in'] == false) {
                $group_id = 0;
                $response = false;
                $url = '/extraweb/login';
                if ($currentPath == 'extraweb/login' || $currentPath == 'extraweb/logout' || $currentPath == 'extraweb/validate-user' || $currentPath == 'extraweb/save-token') {
                    $response = true;
                    $url = '/extraweb/login';
                }
            } else {
                $group_id = $data['_session_group_id'];
                $paramGetGroupUser = [
                    'table_name' => 'tbl_b_group_permissions',
                    'select' => ['id', 'permission_id', 'group_id', 'module_id', 'is_allowed', 'is_active'],
                    'conditions' => [
                        'where' => [
                            ['a.permission_id', '=', $currentPermission->id],
                            ['a.group_id', '=', $group_id]
                        ]
                    ]
                ];
                $getGroupUser = $this->MY_Model->find($request, 'first', $paramGetGroupUser);
                //get module detail
                if ($getGroupUser['data'] == null || ($getGroupUser['data']->is_active == 0 || $getGroupUser['data']->is_allowed == 0)) {
                    $url = '/extraweb/login';
                    if (isset($data['_session_is_logged_in']) && !empty($data['_session_is_logged_in']) && $data['_session_is_logged_in'] == true) {
                        $response = false;
                        $url = '/extraweb/dashboard';
                    } else {
                        $response = true;
                        if (isset($data['_previous']['url']) && !empty($data['_previous']['url'])) {
                            $url = $data['_previous']['url'];
                        }
                        //dd('iyey');
                    }
                } else {
                    $paramGetModule = [
                        'table_name' => 'tbl_a_modules',
                        'conditions' => [
                            'where' => [
                                ['a.id', '=', $getGroupUser['data']->module_id],
                            ]
                        ]
                    ];
                    $getModule = $this->MY_Model->find($request, 'first', $paramGetModule);
                    $param = [
                        'Permission' => $currentPermission,
                        'GroupUser' => $getGroupUser['data'],
                        'Module' => $getModule['data']
                    ];
                    switch ($getGroupUser['data']->module_id) {
                        case 1:
                            $response = false;
                            break;
                        default :
                            $response = true;
                            $url = '/extraweb/login';
                            $data = session()->all();
                            if ($param['Permission']->is_public != 1) {
                                $response = false;
                                //check if session is present
                                if (isset($data['_session_is_logged_in']) && !empty($data['_session_is_logged_in']) && $data['_session_is_logged_in'] == true) {
                                    $response = true;
                                } else {
                                    $response = false;
                                    if (isset($data['_previous']['url']) && !empty($data['_previous']['url'])) {
                                        $url = $data['_previous']['url'];
                                    }
                                }
                            }
                            break;
                    }
                }
            }
        }
        $resp = [
            'code' => 200,
            'is_valid' => $response,
            'url' => $url
        ];
        return $resp;
    }

    public function login_attempt_calc($request, $data) {
        $attempt_total = 3;
        $session = session()->all();
        $params = [
            'table_name' => 'tbl_d_login_attempts',
            'conditions' => [
                'where' => [
                    ['a.email', '=', '%' . $data['userid'] . '%'],
                    ['a.device_id', '=', '%' . $session['_uuid'] . '%'],
                ]
            ],
            'order' => [
                ['a.id', 'desc']
            ]
        ];
        $attemps = $this->MY_Model->find($request, 'all', $params)['data'];
        $date = [];
        if (isset($attemps) && !empty($attemps)) {
            foreach ($attemps AS $key => $value) {
                $date[] = $value->created_date;
            }
        }
        $response = true;
        $messages = '';
        if (isset($attemps) && !empty($attemps) && count($attemps) >= $attempt_total) {
            if ($date) {
                $time_diff = $this->Date->diff($date[0], $this->Date->now(), true);
                if (count($date) > $attempt_total && isset($time_diff) && $time_diff['i'] == 0 && $time_diff['s'] < 60) {
                    $response = false;
                    $messages = 'your ip is in blocked session because had maximum attempts to login, please wait for 60 seconds to cleared your blocked access.';
                } elseif (count($date) > ($attempt_total + 2) && isset($time_diff) && $time_diff['i'] <= 3) {
                    $response = false;
                    $messages = 'your ip is in blocked session because had maximum attempts to login, please wait for 3 minutes to cleared your blocked access.';
                }
            } else {
                $messages = 'you already 3 times attempts to login using this email and password, please wait 60 second for you ip is cleared to attempt to login.';
            }
        }
        return array('status' => $response, 'message' => $messages);
    }

    public function validate_user($request) {
        $data = $request->json()->all();
        if (isset($data) && !empty($data)) {
            $params = [
                'table_name' => 'tbl_a_users',
                'select' => ['a.id', 'a.user_name', 'a.email', 'a.password', 'c.id AS group_id', 'c.name AS group_name'],
                'join' => [
                    'leftJoin' => [
                        ['tbl_b_user_groups AS b', 'b.user_id', '=', 'a.id'],
                        ['tbl_a_groups AS c', 'c.id', '=', 'b.group_id']
                    ]
                ],
                'conditions' => [
                    'where' => [
                        ['a.email', 'like', '%' . base64_decode($data['userid']) . '%'],
                    ]
                ]
            ];
            $user = $this->MY_Model->find($request, 'first', $params)['data'];
            if (isset($user) && !empty($user)) {
                $verify_hash = $this->TokenUser->__verify_hash(base64_decode($data['password']), $user->password);
                $attemps = Authenticate::login_attempt_calc($request, $data);
                if (!$attemps || $attemps['status'] = false) {
                    $code = 500;
                    $msg = $attemps['message']; //'Failed generate token user, you already attempts 3 times to login. Please re-login after 60 seconds';
                    $valid = false;
                    $generate_token = null;
                } else {
                    if ($verify_hash == true) {
                        $code = 200;
                        $msg = 'Successfully generate token user';
                        $valid = true;
                        $generate_token = $this->TokenUser->__generate_token($data, $user);
                    } else {
                        $code = 500;
                        $msg = 'Failed generate token user, user email or password didnt match with database record. ' . $attemps['message'];
                        $valid = false;
                        $generate_token = null;

                        $param = [
                            'email' => $data['userid'],
                            'password_attempt' => base64_decode($data['password']),
                            'device_id' => $data['deviceid'],
                            'ip' => $this->MyHelper->getIp(),
                            'browser' => json_encode($this->MyHelper->getBrowser()),
                            'is_active' => 1,
                            'created_by' => 1,
                            'created_date' => $this->Date->now(),
                            'updated_by' => 1,
                            'updated_date' => $this->Date->now()
                        ];
                        DB::table('tbl_d_login_attempts')->insert($param);
                    }
                }
            } else {
                $code = 500;
                $valid = true;
                $msg = 'cannot found your user id, user access denied.';
                $generate_token = null;
            }
            return $this->MyHelper->_set_response('json', ['code' => $code, 'message' => $msg, 'valid' => $valid, 'meta' => [], 'data' => ['token' => $generate_token]]);
        }
    }

    public function save_token($request) {
        if (isset($request) && !empty($request)) {
            $token = $request['token']['token'];
            //$token_refresh = $request['token']['token_refresh'];
            $decode_jwt = $this->Converter->array_to_object($this->Jwt->decode($token));
            //session()->put();
            session(['_session_token' => $token]);
            //session(['_session_token_refreshed' => $token_refresh]);
            session(['_session_user_id' => $decode_jwt->user_id]);
            session(['_session_group_id' => $decode_jwt->group_id]);
            session(['_session_group_parent_id' => $decode_jwt->group_parent_id]);
            session(['_session_user_name' => $decode_jwt->user_name]);
            session(['_session_user_email' => $decode_jwt->user_email]);
            session(['_session_is_logged_in' => true]);
            session(['_session_expiry_date' => date('Y-m-d H:i:s', strtotime('+24 Hours'))]);
            session()->save();
            return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully save token.', 'valid' => true]);
        }
    }

    public function clear_session() {
        session()->forget('_session_token');
        session()->forget('_session_token_refreshed');
        session()->forget('_session_user_id');
        session()->forget('_session_group_id');
        session()->forget('_session_is_logged_in');
        session()->forget('_session_expiry_date');
        session()->forget('_session_user_name');
        session()->forget('_session_user_email');
        session()->forget('alert-msg');
        session()->flush();
        session()->save();
    }

}
