<?php

namespace App\Http\Controllers\Globals;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\MY_Model;
use App\Models\Tables\Core\Tbl_a_menus;
use App\Models\Tables\Core\Tbl_logs;
use App\Models\Tables\Core\Tbl_b_menu_permission;
use App\Helpers\MyHelper;
use App\Http\Middleware\TokenUser;

/**
 * Description of AjaxController
 *
 * @author I00396.ARIF
 */
class AjaxController extends Controller {

//put your code here

    protected $MY_Model;

    public function __construct(Request $request, MY_Model $MY_Model) {
        parent::__construct($request);
        $this->MY_Model = $MY_Model;
    }

    public function fn_ajax_get(Request $request, $method = '') {
        switch ($method) {
            case "":
                $response = $this->fn($request);
                break;
        }
        return $response;
    }

    public function fn_ajax_post(Request $request, $method = '') {
        switch ($method) {
            case "get-smart-list-email":
                $response = $this->fn_get_smart_list_email($request);
                break;
        }
        return $response;
    }

    protected function fn_get_smart_list_email($request) {
        $data = $request->json()->all();
        if (isset($data['search']) && !empty($data['search'])) {
            $search = $request['search'];
            $conditions = [
                'where' => [
                    ['a.email', 'like', '%' . $search . '%']
                ]
            ];
        } else {
            $conditions = [];
        }
        $params = [
            'table_name' => 'tbl_smart_list_emails',
            'conditions' => $conditions,
            'order' => [
                ['a.first_name', 'asc']
            ]
        ];
        $data = $this->MY_Model->find($request, 'all', $params);
        $arrData = [];
        if (isset($data['data']) && !empty($data['data'])) {
            foreach ($data['data'] AS $key => $value) {
                $arrData[] = [
                    'id' => $value->email,
                    'text' => $value->email
                ];
                //$arrData .= '<li class="" data-id="' . $value->id . '">' . $value->email . '</li>';
            }
        }
        return $this->MyHelper->_set_response('json', ['code' => 200, 'message' => 'successfully fetching data email.', 'valid' => true, 'data' => $arrData]);
    }

}
