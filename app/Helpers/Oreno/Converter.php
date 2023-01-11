<?php

namespace App\Helpers\Oreno;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPClass.php to edit this template
 */

use Illuminate\Http\Request;
use Illuminate\Http\Response;

/**
 * Description of Converter
 *
 * @author User
 */
class Converter {

    //put your code here

    public function array_to_object($data = []) {
        if (!is_array($data)) {
            return 'this is not array';
        }
        return json_decode(json_encode($data), FALSE);
    }

    public function object_to_array($data = []) {
        if (!$data || $data == '') {
            return array();
        }
        return json_decode(json_encode($data), true);
    }

    public function base64url_encode($str) {
        return rtrim(strtr(base64_encode($str), '+/', '-_'), '=');
    }

    public function base64url_decode($str) {
        return base64_decode($str);
    }

    public function base64($string = null, $type = 'encode') {
        if ($string != null) {
            switch ($type) {
                case 'encode':
                    $response = base64_encode(strtolower($string));
                    break;
                default:
                    $response = base64_decode(strtolower($string));
                    break;
            }
            return $response;
        }
    }

}
