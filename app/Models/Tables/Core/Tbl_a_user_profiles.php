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
 * Description of Tbl_a_user_profiles
 *
 * @author elitebook
 */
class Tbl_a_user_profiles extends MY_Model {

    //put your code here  
    public static $table_name = "tbl_a_user_profiles";

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

}
