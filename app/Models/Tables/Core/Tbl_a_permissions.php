<?php

namespace App\Models\Tables\Core;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

use App\Models\MY_Model;
use Illuminate\Support\Facades\DB;

/**
 * Description of Tbl_a_permissions
 *
 * @author elitebook
 */
class Tbl_a_permissions extends MY_Model {

    //put your code here  
    public static $table_name = "tbl_a_permissions";

    public function __construct() {
        parent::__construct();
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

    public function do_delete($request, $id = null, $connection = 'mysql') {
        if (!$id || empty($id) || $id == null) {
            return null;
        }
        return DB::Connection($connection)->table(self::$table_name)->where('id', '=', $id)->delete();
    }

    public function getCurrentPermission($request, $path) {
        $permissionExist = DB::table(self::$table_name)->where('path', '=', $path);
        $permissionExistTotal = $permissionExist->count();
        if ($permissionExistTotal && $permissionExistTotal == 1) {
            $permissionExistGet = $permissionExist->select('id', 'name', 'path', 'controller', 'method', 'is_public', 'is_basic', 'is_active')->first();
            return $permissionExistGet;
        } else {
            return null;
        }
    }

    protected static function get_permissions_notin_group($group_id) {
        return DB::table('tbl_b_group_permissions AS a')->where('group_id', '=', $group_id)->get();
    }

    public function get_all_inselect($request, $params) {
        $limit = ($request->limit) ? $request->limit : 1000;
        $offset = ($request->offset) ? $request->offset : 0;
        $order = 'a.id';
        $order_type = 'desc';
        if (isset($params['order']) && !empty($params['order'])) {
            $order = $params['order']['keyword'];
            $order_type = $params['order']['type'];
        }
        $get_permissions_notin_group = Tbl_a_permissions::get_permissions_notin_group($params['conditions']['group_id']);
        if (isset($get_permissions_notin_group) && !empty($get_permissions_notin_group)) {
            $permission_id = [];
            foreach ($get_permissions_notin_group AS $key => $value) {
                $permission_id[] = $value->permission_id;
            }
        }
        $data = DB::table(self::$table_name . ' AS a')->select('*')->whereNotIn('id', $permission_id)
                        ->offset($offset)
                        ->limit($limit)
                        ->orderBy($order, $order_type)->get();

        $meta = [
            'total' => DB::table(self::$table_name)->count(),
            'offset' => $offset,
            'limit' => $limit,
            'query_param' => $request->getRequestUri()
        ];
        return [
            'meta' => $meta, 'data' => $data
        ];
    }

}
