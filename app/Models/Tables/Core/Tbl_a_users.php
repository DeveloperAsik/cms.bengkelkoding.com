<?php

namespace App\Models\Tables\Core;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

use App\Models\MY_Model;
use Illuminate\Support\Facades\DB;
use App\Helpers\Oreno\Converter;

/**
 * Description of Tbl_a_users
 *
 * @author elitebook
 */
class Tbl_a_users extends MY_Model {

    //put your code here  
    public static $table_name = "tbl_a_users";
    protected $MyHelper;
    protected $Converter;

    public function __construct() {
        parent::__construct();
        $this->Converter = new Converter();
    }


    public function get_by($request, $params = [], $connection = 'mysql') {
        $params = array_merge(['table_name' => self::$table_name], $params);
        return $this->find($request, 'first', $params, $connection);
    }

    public function get_by_id($request, $id, $connection = 'mysql') {
        $params = [
            'table_name' => self::$table_name,
            'conditions' => [
                ['a.id', '=', $id]
            ]
        ];
        return $this->find($request, 'first', $params, $connection);
    }

    public function get_data_by_alias($request, $alias, $connection = 'mysql') {
        $params = [
            'table_name' => self::$table_name,
            'conditions' => [
                ['a.alias', '=', $alias]
            ]
        ];
        return $this->find($request, 'first', $params, $connection);
    }

    public function do_insert($request, $data, $connection = 'mysql') {
        return DB::Connection($connection)->table(self::$table_name)->insert($data);
    }

    public function do_update($request, $data, $options, $connection = 'mysql') {
        if (!$options || empty($options)) {
            return null;
        }
        return DB::Connection($connection)->table(self::$table_name)->where($options['keyword'], $options['value'])->update($data);
    }

    public function do_remove($request, $id = null, $data = [], $connection = 'mysql') {
        if (!$data || empty($data)) {
            return null;
        }
        return DB::Connection($connection)->table(self::$table_name)->where('id', '=', $id)->update($data);
    }

    public function do_delete($request,$id = null, $connection = 'mysql') {
        if (!$id || empty($id) || $id == null) {
            return null;
        }
        return DB::Connection($connection)->table(self::$table_name)->where('id', '=', $id)->delete();
    }

    public function fnGetUserProfiles($request,$user_id = null) {
        $data = $request->session()->all();
        if ($data) {
            $user_profiles = DB::table(self::$table_name . ' AS a')
                            ->select('a.id', 'a.user_name', 'a.first_name', 'a.last_name', 'a.email', 'c.id AS group_id', 'c.name AS group_name', 'e.address', 'e.lat', 'e.lng', 'e.zoom', 'e.facebook', 'e.twitter', 'e.instagram', 'e.linkedin', 'e.photo', 'e.last_education', 'e.last_education_institution', 'e.skill', 'e.notes', 'e.description')
                            ->leftJoin('tbl_b_user_groups AS b', 'b.user_id', '=', 'a.id')
                            ->leftJoin('tbl_a_groups AS c', 'c.id', '=', 'b.group_id')
                            ->leftJoin('tbl_b_group_permissions AS d', 'd.group_id', '=', 'b.group_id')
                            ->leftJoin('tbl_a_user_profiles AS e', 'e.id', '=', 'a.profile_id')
                            ->where('a.id', '=', $user_id)->first();
            $group_permission = DB::table('tbl_b_group_permissions AS a')
                            ->select('b.id', 'b.name', 'b.path', 'b.controller', 'b.method', 'c.id AS group_id', 'c.name AS group_name', 'd.id AS module_id', 'd.name AS module_name')
                            ->leftJoin('tbl_a_permissions AS b', 'b.id', '=', 'a.permission_id')
                            ->leftJoin('tbl_a_groups AS c', 'c.id', '=', 'a.group_id')
                            ->leftJoin('tbl_a_modules AS d', 'd.id', '=', 'a.module_id')
                            ->where('a.group_id', '=', $user_id)->get();
            return $this->Converter->array_to_object(['user_profile' => $user_profiles, 'permission' => $group_permission]);
        } else {
            return null;
        }
    }

}
