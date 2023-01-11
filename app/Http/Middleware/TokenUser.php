<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Http\Middleware;

use Illuminate\Support\Facades\DB;
use App\Helpers\MyHelper;
use App\Helpers\Oreno\Jwt;
use App\Helpers\Oreno\Date;
use App\Helpers\Oreno\Encrypter;
use App\Models\MY_Model;

/**
 * Description of TokenUser
 *
 * @author I00396.ARIF
 */
class TokenUser {

    //put your code here

    protected $MY_Model;
    protected $MyHelper;
    protected $Jwt;
    protected $Date;
    protected $Encrypter;

    public function __construct() {
        $this->MY_Model = new MY_Model();
        $this->MyHelper = new MyHelper();
        $this->Jwt = new Jwt();
        $this->Date = new Date();
        $this->Encrypter = new Encrypter();
    }

    public function __generate_token($request, $data) {
        if (isset($data) && !empty($data)) {
            $group_id = $data->group_id;
            $parent_group_id = 0;
            $group = DB::table('tbl_b_group_permissions AS a')->where('a.group_id', '=', $group_id)->first();
            if (empty($group) || $group == null) {
                //$group = TokenUser::get_group($request, $data->group_id);
                $user1 = DB::table('tbl_a_groups AS a')
                                ->select('a.id', 'a.name', 'a.parent_id', 'b.name AS parent_name')
                                ->join('tbl_a_groups AS b', 'b.id', '=', 'a.parent_id')
                                ->where('a.id', '=', $group_id)->first();
                if (isset($user1) && !empty($user1) && $user1->parent_id != 0) {
                    $user_2 = DB::table('tbl_a_groups AS a')
                                    ->select('a.id', 'a.name', 'a.parent_id', 'b.name AS parent_name')
                                    ->join('tbl_a_groups AS b', 'b.id', '=', 'a.parent_id')
                                    ->where('a.id', '=', $user1->parent_id)->first();
                    if (isset($user_2) && !empty($user_2) && $user_2->parent_id != 0) {
                        $user_3 = DB::table('tbl_a_groups AS a')
                                        ->select('a.id', 'a.name', 'a.parent_id', 'b.name AS parent_name')
                                        ->join('tbl_a_groups AS b', 'b.id', '=', 'a.parent_id')
                                        ->where('a.id', '=', $user_2->parent_id)->first();
                        if (isset($user_3) && !empty($user_3) && $user_3->parent_id != 0) {
                            $user_4 = DB::table('tbl_a_groups AS a')
                                            ->select('a.id', 'a.name', 'a.parent_id', 'b.name AS parent_name')
                                            ->join('tbl_a_groups AS b', 'b.id', '=', 'a.parent_id')
                                            ->where('a.id', '=', $user_3->parent_id)->first();
                            if (isset($user_3) && !empty($user_3)) {

                                $parent_group_id = $user_4->parent_id;
                            } else {
                                $parent_group_id = $user_3->parent_id;
                            }
                        } else {
                            $parent_group_id = $user_2->parent_id;
                        }
                    } else {
                        $parent_group_id = $user_1->parent_id;
                    }
                }
            }
            $token_exist = DB::table('tbl_a_user_tokens AS a')->select('a.id', 'a.token', 'a.expiry', 'a.created_date')->where('a.created_by', '=', $data->id)->first();
            $headers = array('alg' => 'HS256', 'typ' => 'JWT');
            $payload = [
                'user_id' => $data->id,
                'group_id' => $group_id,
                'group_parent_id' => $parent_group_id,
                'user_name' => $data->user_name,
                'user_email' => $data->email,
                'create_date' => strtotime($this->Date->now()),
                'expired_date' => strtotime(date('Y-m-d H:i:s', strtotime('+24 Hours')))
            ];
            $token = $this->Jwt->encode($headers, $payload);
            if ($token_exist && $token_exist != null && strtotime($token_exist->expiry) > strtotime($token_exist->created_date)) {
                //expired
                $response = DB::table('tbl_a_user_tokens')->where('id', $token_exist->id)->update([
                    'token' => $token,
                    'expiry' => date('Y-m-d H:i:s', strtotime('+24 Hours')),
                    'is_logged_in' => 1,
                    'is_expiry' => 0,
                    'is_active' => 1,
                    'group_id' => $group_id,
                    'created_by' => $data->id,
                    'created_date' => $this->Date->now(),
                    'updated_by' => $data->id,
                    'updated_date' => $this->Date->now(),
                ]);
            } else {
                $response = DB::table('tbl_a_user_tokens')->insert([
                    'token' => $token,
                    'expiry' => date('Y-m-d H:i:s', strtotime('+24 Hours')),
                    'is_active' => 1,
                    'is_logged_in' => 1,
                    'group_id' => $group_id,
                    'created_by' => $data->id,
                    'created_date' => $this->Date->now(),
                    'updated_by' => $data->id,
                    'updated_date' => $this->Date->now(),
                ]);
            }
            if ($response) {
                return ['token' => $token];
            } else {
                return null;
            }
        }
    }

    public function __verify_token($token_jwt = null) {
        if ($token_jwt != null) {
            return $this->MyHelper->is_jwt_valid($token_jwt);
        }
    }

    public function __string_hash($password_raw) {
        if (isset($password_raw) && !empty($password_raw)) {
            //$salt = config('app.salt');
            //$password_peppered = hash_hmac("sha256", $password_raw, $salt);
            //return password_hash($password_peppered, PASSWORD_ARGON2ID);
            return $this->Encrypter->encrypt($password_raw);
        } else {
            return null;
        }
    }

    public function __verify_hash($password_raw, $password_hashed) {
        if (isset($password_raw) && !empty($password_raw)) {
            //$salt = config('app.salt');
            //$password_peppered = hash_hmac("sha256", $password_raw, $salt);
            //if (password_verify($password_peppered, $password_hashed)) {
            //    return true;
            //} else {
            //    return false;
            //}
           $password_parse = $this->Encrypter->decrypt($password_hashed);
           if($password_parse == $password_raw){
               return true;
           }else{
               return false;
           }
        } else {
            return null;
        }
    }

}
