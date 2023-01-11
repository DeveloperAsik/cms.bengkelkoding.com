<?php

namespace App\Helpers\Oreno;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPClass.php to edit this template
 */

use Illuminate\Http\Request;
use Illuminate\Http\Response;

/**
 * Description of Cookie
 *
 * @author User
 */
class Cookie {

    //put your code here

    public function create($request, $params = []) {
        if ($params) {
            $minutes = time() + (86400 * 30);
            if (isset($params['minutes']) && !empty($params['minutes'])) {
                $minutes = $params['minutes'];
            }
            setcookie($params['name'], $params['value'], $minutes, "/"); // 86400 = 1 day
            return true;
        }
    }

    public function update($request, $params = []) {
        $minutes = 60;
        $response = new Response('Set Cookie');
        $response->withCookie(cookie($params['name'], $params['value'], $minutes, $params['path']));
        return $response;
    }

    public function get($request, $params = []) {
        return $request->cookie($params['name']);
    }

    public function delete($params = []) {
        setcookie($params['name'], "", time() - 3600, "/");
    }

}
