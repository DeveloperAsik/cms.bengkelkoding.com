<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

Route::middleware(['auth'])->group(function ($e) {
    Route::get('/', function () {
        return redirect('/extraweb/login');
    });

    /*
     * 
     * extraweb routes start here
     * 
     */
    Route::group(['prefix' => 'extraweb'], function ($e) {
        Route::get('/', 'App\Http\Controllers\Backend\AuthController@login')->name('extraweb.login');
        Route::get('/login', 'App\Http\Controllers\Backend\AuthController@login')->name('extraweb.login2');
        Route::get('/logout', 'App\Http\Controllers\Backend\AuthController@logout')->name('extraweb.logout');

        Route::get('/forgot-password', 'App\Http\Controllers\Backend\AuthController@forgot_password')->name('extraweb.forgot_password');
        Route::get('/register', 'App\Http\Controllers\Backend\AuthController@register')->name('extraweb.register');

        Route::post('/validate-user', function (Request $request) {
            $Authenticate = new App\Http\Middleware\Authenticate();
            return $Authenticate->validate_user($request);
        })->name('extraweb.validate');
        Route::post('/save-token', function (Request $request) {
            $this->Authenticate = new App\Http\Middleware\Authenticate();
            return $this->Authenticate->save_token($request);
        })->name('extraweb.save_token');

        Route::get('/dashboard', 'App\Http\Controllers\Backend\AuthController@dashboard')->name('extraweb.dashboard');
        Route::get('/logs', 'App\Http\Controllers\Backend\AuthController@logs')->name('extraweb.logs');

        Route::prefix('profile')->group(function () {
            Route::get('/', 'App\Http\Controllers\Backend\AuthController@profile')->name('extraweb.profile');
            Route::get('/update', 'App\Http\Controllers\Backend\AuthController@update_profile')->name('extraweb.profile_update');
            Route::post('/update', 'App\Http\Controllers\Backend\AuthController@submit_update_profile')->name('extraweb.profile_update2');
            Route::post('/upload_photo', 'App\Http\Controllers\Backend\AuthController@fnUploadPhoto')->name('extraweb.fnUploadPhoto');
            Route::post('/get-group-permission-list', 'App\Http\Controllers\Backend\AuthController@get_group_permission_list')->name('extraweb.get-group-permission-list');
        });

        Route::prefix('ajax')->group(function () {
            Route::get('/get/{method}', 'App\Http\Controllers\Globals\AjaxController@fn_ajax_get')->name('global.ajax_get');
            Route::post('/post/{method}', 'App\Http\Controllers\Globals\AjaxController@fn_ajax_post')->name('global.ajax_post');
        });
        Route::prefix('messaging')->group(function () {
            Route::get('/compose', 'App\Http\Controllers\Backend\Messaging\MailController@compose')->name('global.compose');
            Route::post('/compose', 'App\Http\Controllers\Backend\Messaging\MailController@insert')->name('global.compose_insert');
            Route::get('/inbox', 'App\Http\Controllers\Backend\Messaging\MailController@inbox')->name('global.inbox');
            Route::get('/sent', 'App\Http\Controllers\Backend\Messaging\MailController@sent')->name('global.sent');
            Route::get('/draft', 'App\Http\Controllers\Backend\Messaging\MailController@draft')->name('global.draft');
            Route::get('/junk', 'App\Http\Controllers\Backend\Messaging\MailController@junk')->name('global.junk');
            Route::post('/inbox/get_list', 'App\Http\Controllers\Backend\Messaging\MailController@get_list')->name('global.get_list');
            Route::get('/detail/{id}', 'App\Http\Controllers\Backend\Messaging\MailController@detail')->name('global.detail');
            Route::get('/chat', 'App\Http\Controllers\Backend\Messaging\MailController@chat')->name('global.chat');
        });
        
        Route::prefix('master')->group(function () {
            Route::prefix('user')->group(function () {
                Route::get('/', 'App\Http\Controllers\Backend\Master\UserController@view')->name('extraweb.master.users.view1');
                Route::get('/view', 'App\Http\Controllers\Backend\Master\UserController@view')->name('extraweb.master.users.view2');
                Route::post('/get_list', 'App\Http\Controllers\Backend\Master\UserController@get_list')->name('extraweb.master.users.get_list');
                Route::get('/create', 'App\Http\Controllers\Backend\Master\UserController@create')->name('extraweb.master.users.create');
                Route::get('/edit/{id}', 'App\Http\Controllers\Backend\Master\UserController@edit')->name('extraweb.master.users.edit');
                Route::post('/update/{id}', 'App\Http\Controllers\Backend\Master\UserController@update')->name('extraweb.master.users.update');
                Route::post('/insert', 'App\Http\Controllers\Backend\Master\UserController@insert')->name('extraweb.master.users.insert');
                Route::get('/remove/{id}', 'App\Http\Controllers\Backend\Master\UserController@remove')->name('extraweb.master.users.remove');
                Route::get('/delete/{id}', 'App\Http\Controllers\Backend\Master\UserController@delete')->name('extraweb.master.users.delete');
                Route::post('/get_list_menu', 'App\Http\Controllers\Backend\Master\UserController@get_list_menu')->name('extraweb.master.users.get_list_menu');
                Route::post('/get_list_permission', 'App\Http\Controllers\Backend\Master\UserController@get_list_permission')->name('extraweb.master.users.get_list_permission');
            });
            Route::prefix('group')->group(function () {
                Route::get('/', 'App\Http\Controllers\Backend\Master\GroupController@view')->name('extraweb.master.group.view1');
                Route::get('/view', 'App\Http\Controllers\Backend\Master\GroupController@view')->name('extraweb.master.group.view2');
                Route::post('/get_list', 'App\Http\Controllers\Backend\Master\GroupController@get_list')->name('extraweb.master.group.get_list');
                Route::get('/create', 'App\Http\Controllers\Backend\Master\GroupController@create')->name('extraweb.master.group.create');
                Route::get('/edit/{id}', 'App\Http\Controllers\Backend\Master\GroupController@edit')->name('extraweb.master.group.edit');
                Route::post('/update/{id}', 'App\Http\Controllers\Backend\Master\GroupController@update')->name('extraweb.master.group.update');
                Route::post('/insert', 'App\Http\Controllers\Backend\Master\GroupController@insert')->name('extraweb.master.group.insert');
                Route::get('/remove/{id}', 'App\Http\Controllers\Backend\Master\GroupController@remove')->name('extraweb.master.group.remove');
                Route::get('/delete/{id}', 'App\Http\Controllers\Backend\Master\GroupController@delete')->name('extraweb.master.group.delete');
                Route::prefix('scheme')->group(function () {
                    Route::get('/view/{id}', 'App\Http\Controllers\Backend\Master\SchemeController@view')->name('extraweb.master.group.scheme.view2');
                    Route::post('/get_list', 'App\Http\Controllers\Backend\Master\SchemeController@get_list')->name('extraweb.master.group.scheme.get_list');
                    Route::get('/create', 'App\Http\Controllers\Backend\Master\SchemeController@create')->name('extraweb.master.group.scheme.create');
                    Route::get('/edit/{id}', 'App\Http\Controllers\Backend\Master\SchemeController@edit')->name('extraweb.master.group.scheme.edit');
                    Route::post('/update/{id}', 'App\Http\Controllers\Backend\Master\SchemeController@update')->name('extraweb.master.group.scheme.update');
                    Route::post('/insert/{id}', 'App\Http\Controllers\Backend\Master\SchemeController@insert')->name('extraweb.master.group.scheme.insert');
                    Route::get('/remove/{id}', 'App\Http\Controllers\Backend\Master\SchemeController@remove')->name('extraweb.master.group.scheme.remove');
                    Route::get('/delete/{id}', 'App\Http\Controllers\Backend\Master\SchemeController@delete')->name('extraweb.master.group.scheme.delete');
                });
            });
            Route::prefix('permission')->group(function () {
                Route::get('/', 'App\Http\Controllers\Backend\Master\PermissionController@view')->name('extraweb.master.permission.view1');
                Route::get('/view', 'App\Http\Controllers\Backend\Master\PermissionController@view')->name('extraweb.master.permission.view2');
                Route::post('/get_list', 'App\Http\Controllers\Backend\Master\PermissionController@get_list')->name('extraweb.master.permission.get_list');
                Route::get('/create', 'App\Http\Controllers\Backend\Master\PermissionController@create')->name('extraweb.master.permission.create');
                Route::get('/edit/{id}', 'App\Http\Controllers\Backend\Master\PermissionController@edit')->name('extraweb.master.permission.edit');
                Route::post('/update/{id}', 'App\Http\Controllers\Backend\Master\PermissionController@update')->name('extraweb.master.permission.update');
                Route::post('/insert', 'App\Http\Controllers\Backend\Master\PermissionController@insert')->name('extraweb.master.permission.insert');
                Route::get('/remove/{id}', 'App\Http\Controllers\Backend\Master\PermissionController@remove')->name('extraweb.master.permission.remove');
                Route::get('/delete/{id}', 'App\Http\Controllers\Backend\Master\PermissionController@delete')->name('extraweb.master.permission.delete');
            });
            Route::prefix('module')->group(function () {
                Route::get('/', 'App\Http\Controllers\Backend\Master\ModuleController@view')->name('extraweb.master.module.view1');
                Route::get('/view', 'App\Http\Controllers\Backend\Master\ModuleController@view')->name('extraweb.master.module.view2');
                Route::post('/get_list', 'App\Http\Controllers\Backend\Master\ModuleController@get_list')->name('extraweb.master.module.get_list');
                Route::get('/create', 'App\Http\Controllers\Backend\Master\ModuleController@create')->name('extraweb.master.module.create');
                Route::get('/edit/{id}', 'App\Http\Controllers\Backend\Master\ModuleController@edit')->name('extraweb.master.module.edit');
                Route::post('/update/{id}', 'App\Http\Controllers\Backend\Master\ModuleController@update')->name('extraweb.master.module.update');
                Route::post('/insert', 'App\Http\Controllers\Backend\Master\ModuleController@insert')->name('extraweb.master.module.insert');
                Route::get('/remove/{id}', 'App\Http\Controllers\Backend\Master\ModuleController@remove')->name('extraweb.master.module.remove');
                Route::get('/delete/{id}', 'App\Http\Controllers\Backend\Master\ModuleController@delete')->name('extraweb.master.module.delete');
            });
            Route::prefix('menu')->group(function () {
                Route::get('/', 'App\Http\Controllers\Backend\Master\MenuController@view')->name('extraweb.master.menu.view1');
                Route::get('/view', 'App\Http\Controllers\Backend\Master\MenuController@view')->name('extraweb.master.menu.view2');
                Route::post('/get_list', 'App\Http\Controllers\Backend\Master\MenuController@get_list')->name('extraweb.master.menu.get_list');
                Route::get('/create', 'App\Http\Controllers\Backend\Master\MenuController@create')->name('extraweb.master.menu.create');
                Route::get('/edit/{id}', 'App\Http\Controllers\Backend\Master\MenuController@edit')->name('extraweb.master.menu.edit');
                Route::post('/update/{id}', 'App\Http\Controllers\Backend\Master\MenuController@update')->name('extraweb.master.menu.update');
                Route::post('/insert', 'App\Http\Controllers\Backend\Master\MenuController@insert')->name('extraweb.master.menu.insert');
                Route::get('/remove/{id}', 'App\Http\Controllers\Backend\Master\MenuController@remove')->name('extraweb.master.menu.remove');
                Route::get('/delete/{id}', 'App\Http\Controllers\Backend\Master\MenuController@delete')->name('extraweb.master.menu.delete');
            });
            Route::prefix('controller')->group(function () {
                Route::get('/', 'App\Http\Controllers\Backend\Master\ContrController@view')->name('extraweb.master.controller.view1');
                Route::get('/view', 'App\Http\Controllers\Backend\Master\ContrController@view')->name('extraweb.master.controller.view2');
                Route::post('/get_list', 'App\Http\Controllers\Backend\Master\ContrController@get_list')->name('extraweb.master.controller.get_list');
                Route::get('/create', 'App\Http\Controllers\Backend\Master\ContrController@create')->name('extraweb.master.controller.create');
                Route::get('/edit/{id}', 'App\Http\Controllers\Backend\Master\ContrController@edit')->name('extraweb.master.controller.edit');
                Route::post('/update/{id}', 'App\Http\Controllers\Backend\Master\ContrController@update')->name('extraweb.master.controller.update');
                Route::post('/insert', 'App\Http\Controllers\Backend\Master\ContrController@insert')->name('extraweb.master.controller.insert');
                Route::get('/remove/{id}', 'App\Http\Controllers\Backend\Master\ContrController@remove')->name('extraweb.master.controller.remove');
                Route::get('/delete/{id}', 'App\Http\Controllers\Backend\Master\ContrController@delete')->name('extraweb.master.controller.delete');
            });
            Route::prefix('method')->group(function () {
                Route::get('/', 'App\Http\Controllers\Backend\Master\MethodController@view')->name('extraweb.master.method.view1');
                Route::get('/view', 'App\Http\Controllers\Backend\Master\MethodController@view')->name('extraweb.master.method.view2');
                Route::post('/get_list', 'App\Http\Controllers\Backend\Master\MethodController@get_list')->name('extraweb.master.method.get_list');
                Route::get('/create', 'App\Http\Controllers\Backend\Master\MethodController@create')->name('extraweb.master.method.create');
                Route::get('/edit/{id}', 'App\Http\Controllers\Backend\Master\MethodController@edit')->name('extraweb.master.method.edit');
                Route::post('/update/{id}', 'App\Http\Controllers\Backend\Master\MethodController@update')->name('extraweb.master.method.update');
                Route::post('/insert', 'App\Http\Controllers\Backend\Master\MethodController@insert')->name('extraweb.master.method.insert');
                Route::get('/remove/{id}', 'App\Http\Controllers\Backend\Master\MethodController@remove')->name('extraweb.master.method.remove');
                Route::get('/delete/{id}', 'App\Http\Controllers\Backend\Master\MethodController@delete')->name('extraweb.master.method.delete');
            });
        });
        Route::prefix('prefferences')->group(function () {
            Route::prefix('user')->group(function () {
                Route::prefix('groups')->group(function () {
                    Route::get('/view', 'App\Http\Controllers\Backend\Prefferences\UserGroupController@view')->name('extraweb.prefferences.UserGroup.view');
                    Route::post('/get_list', 'App\Http\Controllers\Backend\Prefferences\UserGroupController@get_list')->name('extraweb.prefferences.UserGroup.view2');
                    Route::get('/create', 'App\Http\Controllers\Backend\Prefferences\UserGroupController@create')->name('extraweb.prefferences.UserGroup.create');
                    Route::get('/edit/{id}', 'App\Http\Controllers\Backend\Prefferences\UserGroupController@edit')->name('extraweb.prefferences.UserGroup.edit');
                    Route::post('/update/{id}', 'App\Http\Controllers\Backend\Prefferences\UserGroupController@update')->name('extraweb.prefferences.UserGroup.update');
                    Route::post('/insert', 'App\Http\Controllers\Backend\Prefferences\UserGroupController@insert')->name('extraweb.prefferences.UserGroup.insert');
                    Route::get('/remove/{id}', 'App\Http\Controllers\Backend\Prefferences\UserGroupController@remove')->name('extraweb.prefferences.UserGroup.remove');
                    Route::get('/delete/{id}', 'App\Http\Controllers\Backend\Prefferences\UserGroupController@delete')->name('extraweb.prefferences.UserGroup.delete');
                });
                Route::prefix('permissions')->group(function () {
                    Route::get('/view', 'App\Http\Controllers\Backend\Prefferences\UserPermissionsController@view')->name('extraweb.prefferences.UserPermissions.view1');
                    Route::post('/get_list', 'App\Http\Controllers\Backend\Prefferences\UserPermissionsController@get_list')->name('extraweb.prefferences.UserPermissions.view2');
                    Route::get('/create', 'App\Http\Controllers\Backend\Prefferences\UserPermissionsController@create')->name('extraweb.prefferences.UserPermissions.create');
                    Route::get('/edit/{id}', 'App\Http\Controllers\Backend\Prefferences\UserPermissionsController@edit')->name('extraweb.prefferences.UserPermissions.edit');
                    Route::post('/update/{id}', 'App\Http\Controllers\Backend\Prefferences\UserPermissionsController@update')->name('extraweb.prefferences.UserPermissions.update');
                    Route::post('/insert', 'App\Http\Controllers\Backend\Prefferences\UserPermissionsController@insert')->name('extraweb.prefferences.UserPermissions.insert');
                    Route::get('/remove/{id}', 'App\Http\Controllers\Backend\Prefferences\UserPermissionsController@remove')->name('extraweb.prefferences.UserPermissions.remove');
                    Route::get('/delete/{id}', 'App\Http\Controllers\Backend\Prefferences\UserPermissionsController@delete')->name('extraweb.prefferences.UserPermissions.delete');
                });
            });
            Route::prefix('group')->group(function () {
                Route::prefix('permissions')->group(function () {
                    Route::get('/view', 'App\Http\Controllers\Backend\Prefferences\GroupPermissionController@view')->name('extraweb.prefferences.GroupPermissions.view1');
                    Route::post('/get_list', 'App\Http\Controllers\Backend\Prefferences\GroupPermissionController@get_list')->name('extraweb.prefferences.GroupPermissions.view2');
                    Route::get('/create', 'App\Http\Controllers\Backend\Prefferences\GroupPermissionController@create')->name('extraweb.prefferences.GroupPermissions.create');
                    Route::get('/edit/{id}', 'App\Http\Controllers\Backend\Prefferences\GroupPermissionController@edit')->name('extraweb.prefferences.GroupPermissions.edit');
                    Route::post('/update/{id}', 'App\Http\Controllers\Backend\Prefferences\GroupPermissionController@update')->name('extraweb.prefferences.GroupPermissions.update');
                    Route::post('/insert', 'App\Http\Controllers\Backend\Prefferences\GroupPermissionController@insert')->name('extraweb.prefferences.GroupPermissions.insert');
                    Route::get('/remove/{id}', 'App\Http\Controllers\Backend\Prefferences\GroupPermissionController@remove')->name('extraweb.prefferences.GroupPermissions.remove');
                    Route::get('/delete/{id}', 'App\Http\Controllers\Backend\Prefferences\GroupPermissionController@delete')->name('extraweb.prefferences.GroupPermissions.delete');
                });
            });
            Route::prefix('menu')->group(function () {
                Route::prefix('permissions')->group(function () {
                    Route::get('/view', 'App\Http\Controllers\Backend\Prefferences\MenuPermissionController@view')->name('extraweb.prefferences.MenuPermissions.view1');
                    Route::post('/get_list', 'App\Http\Controllers\Backend\Prefferences\MenuPermissionController@get_list')->name('extraweb.prefferences.MenuPermissions.view2');
                    Route::get('/create', 'App\Http\Controllers\Backend\Prefferences\MenuPermissionController@create')->name('extraweb.prefferences.MenuPermissions.create');
                    Route::get('/edit/{id}', 'App\Http\Controllers\Backend\Prefferences\MenuPermissionController@edit')->name('extraweb.prefferences.MenuPermissions.edit');
                    Route::post('/update/{id}', 'App\Http\Controllers\Backend\Prefferences\MenuPermissionController@update')->name('extraweb.prefferences.MenuPermissions.update');
                    Route::post('/insert', 'App\Http\Controllers\Backend\Prefferences\MenuPermissionController@insert')->name('extraweb.prefferences.MenuPermissions.insert');
                    Route::get('/remove/{id}', 'App\Http\Controllers\Backend\Prefferences\MenuPermissionController@remove')->name('extraweb.prefferences.MenuPermissions.remove');
                    Route::get('/delete/{id}', 'App\Http\Controllers\Backend\Prefferences\MenuPermissionController@delete')->name('extraweb.prefferences.MenuPermissions.delete');
                });
            });
        });
    });
    /*
     * 
     * extraweb routes end here
     * 
     */
});

Route::group(['prefix' => 'microsite'], function ($e) {
    Route::group(['prefix' => 'games'], function ($e) {
        Route::get('/', 'App\Http\Controllers\Microsite\GamesController@index')->name('games.index');
        Route::get('/ordered-numbers', 'App\Http\Controllers\Microsite\GamesController@orderd_numbered')->name('games.orderd_numbered');
        Route::get('/matching-photos', 'App\Http\Controllers\Microsite\GamesController@matching_photos')->name('games.matching_photos');
        Route::get('/pingpong', 'App\Http\Controllers\Microsite\GamesController@pingpong')->name('games.pingpong');
        Route::get('/snake', 'App\Http\Controllers\Microsite\GamesController@snake')->name('games.snake');
        Route::get('/flapy-bird', 'App\Http\Controllers\Microsite\GamesController@flapy_bird')->name('games.flapy_bird');
    });

    Route::group(['prefix' => 'feature'], function ($e) {
        Route::get('/', 'App\Http\Controllers\Microsite\FeatureController@index')->name('feature.index');
        Route::get('/image-to-ascii', 'App\Http\Controllers\Microsite\FeatureController@image_to_ascii')->name('feature.image-to-ascii');
    });
});
Route::get('/get-all-session', function (Request $request) {
    dd(session()->all());
});

Route::get('/flush-session', function (Request $request) {
    Authenticate::clear_session();
    dd(session()->all());
});

Route::post('/remove-session-flash', function (Request $request) {
    $type = $request->type;
    $close = ($request->close) ? true : false;
    $data = $request->session()->all();
    $arr_session_key = array_keys($data);
    if ($arr_session_key) {
        foreach ($arr_session_key AS $keywords => $values) {
            if ($values == 'alert-msg' && $close == true && $type == 'alert') {
                session()->forget($values);
            }
        }
    }
    session()->save();
});
