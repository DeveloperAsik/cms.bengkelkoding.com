<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/summernote/summernote-bs4.min.js"></script>
<script type="text/javascript" src="{{config('app.base_assets_uri')}}/templates/metronic/assets/global/plugins/dropzone/dropzone.js"></script>
<script type="text/javascript" src="{{config('app.base_assets_uri')}}/templates/metronic/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<script src="{{config('app.base_assets_uri')}}/templates/metronic/assets/global/plugins/jstree/dist/jstree.min.js"></script>
<script>
var table_permission_select = function () {
    $('#permission_select').DataTable({
        "sPaginationType": "bootstrap",
        "paging": true,
        "pagingType": "full_numbers",
        "pageLength": 10,
        "ordering": false,
        "serverSide": true,
        "cache": false,
        "processing": true,
        "lengthChange": true,
        "lengthMenu": [[10, 25, 50, 100, 150, 200, 500, -1], [10, 25, 50, 100, 150, 200, 500, "1000"]],
        "language": {
            processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span> '
        },
        "ajax": {
            url: _base_extraweb_uri + '/master/user/get_list?a=2',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: 'POST'
        },
        "columns": [
            {"data": "id"},
            {"data": "name"},
            {"data": "path"},
            {"data": "controller"},
            {"data": "method"},
            {"data": "action"}
        ]
    });
};
var table_menu_select_basic = function () {
    $('#menu_select_basic').DataTable({
        "sPaginationType": "bootstrap",
        "paging": true,
        "pagingType": "full_numbers",
        "pageLength": 10,
        "ordering": false,
        "serverSide": true,
        "cache": false,
        "processing": true,
        "lengthChange": true,
        "lengthMenu": [[10, 25, 50, 100, 150, 200, 500, -1], [10, 25, 50, 100, 150, 200, 500, "1000"]],
        "language": {
            processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span> '
        },
        "ajax": {
            url: _base_extraweb_uri + '/master/user/get_list?a=3&type=basic',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: 'POST'
        },
        "columns": [
            {"data": "id"},
            {"data": "name"},
            {"data": "path"},
            {"data": "level"},
            {"data": "rank"},
            {"data": "action"}
        ]
    });
};
var table_menu_select = function () {
    $('#menu_select').DataTable({
        "sPaginationType": "bootstrap",
        "paging": true,
        "pagingType": "full_numbers",
        "pageLength": 10,
        "ordering": false,
        "serverSide": true,
        "cache": false,
        "processing": true,
        "lengthChange": true,
        "lengthMenu": [[10, 25, 50, 100, 150, 200, 500, -1], [10, 25, 50, 100, 150, 200, 500, "1000"]],
        "language": {
            processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span> '
        },
        "ajax": {
            url: _base_extraweb_uri + '/master/user/get_list?a=3',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: 'POST'
        },
        "columns": [
            {"data": "id"},
            {"data": "name"},
            {"data": "path"},
            {"data": "level"},
            {"data": "rank"},
            {"data": "action"}
        ]
    });
};

var getAllCheckBoxPermission = function () {
    //($('input[type="checkbox"][name="is_active"]:checked').val())
    var check = $('input[type="checkbox"][name="is_permission_allowed[]"]');
    var formdata = [];
    for (var i = 0; i < check.length; i++) {
        console.log(check[i].checked);
        formdata.push({
            'group_id': check[i].attributes.value.value,
            'checked': check[i].checked,
            'action': 'is_not_allowed'
        });
    }
    return formdata;
};

var getAllCheckBoxMenu = function () {
    //($('input[type="checkbox"][name="is_active"]:checked').val())
    var check = $('input[type="checkbox"][name="is_menu_allowed[]"]:checked');
    var formdata = [];
    for (var i = 0; i < check.length; i++) {
        formdata.push({
            'menu_id': check[i].attributes.value.value,
            'checked': check[i].checked,
            'action': 'is_not_allowed'
        });
    }
    return formdata;
};

var fnGetTreeMenu = function () {
    var uri = _base_extraweb_uri + '/master/menu/get_list?a=5';
    var response = fnAjaxSend({}, uri, "POST", {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
    if (response.status == 200) {
        return response.responseJSON.data
    } else {
        return null;
    }
};
var CreateJS = function () {
    return {
        //main function to initiate the module
        init: function () {
            fnAlertStr('CreateJS successfully load', 'success', {timeOut: 2000});
            var table = $('#permissions').DataTable({
                "sPaginationType": "bootstrap",
                "paging": true,
                "pagingType": "full_numbers",
                "pageLength": 10,
                "ordering": false,
                "serverSide": true,
                "cache": false,
                "processing": true,
                "lengthChange": true,
                "lengthMenu": [[10, 25, 50, 100, 150, 200, 500, -1], [10, 25, 50, 100, 150, 200, 500, "1000"]],
                "language": {
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span> '
                },
                "ajax": {
                    url: _base_extraweb_uri + '/master/user/get_list?a=2',
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    type: 'POST'
                },
                "columnDefs": [{
                        className: 'text-center',
                        targets: 5
                    }],
                "columns": [
                    {"data": "id"},
                    {"data": "name"},
                    {"data": "path"},
                    {"data": "controller"},
                    {"data": "method"},
                    {"data": "action"}
                ]
            });
            //var table2 = $('#menu').DataTable({
            //    "sPaginationType": "bootstrap",
            //    "paging": true,
            //    "pagingType": "full_numbers",
            //    "pageLength": 10,
            //    "ordering": false,
            //    "serverSide": true,
            //    "cache": false,
            //    "processing": true,
            //    "lengthChange": true,
            //    "lengthMenu": [[10, 25, 50, 100, 150, 200, 500, -1], [10, 25, 50, 100, 150, 200, 500, "1000"]],
            //    "language": {
            //        processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span> '
            //    },
            //    "ajax": {
            //        url: _base_extraweb_uri + '/master/user/get_list?a=3',
            //        headers: {
            //            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            //        },
            //        type: 'POST'
            //    },
            //    "columnDefs": [{
            //            className: 'text-center',
            //            targets: 5
            //        }],
            //    "columns": [
            //        {"data": "id"},
            //        {"data": "name"},
            //        {"data": "path"},
            //        {"data": "level"},
            //        {"data": "rank"},
            //        {"data": "action"}
            //    ]
            //});
            $("#treeMenu").jstree({
                "core": {
                    "themes": {
                        "responsive": false
                    },
                    "check_callback": true,
                    "data": fnGetTreeMenu()
                },
                "types": {
                    "default": {
                        "icon": "fa fa-folder icon-state-warning icon-lg"
                    },
                    "file": {
                        "icon": "fa fa-file icon-state-warning icon-lg"
                    }
                },
                "state": {"key": "demo2"},
                "plugins": ["contextmenu", "dnd", "state", "types", "checkbox"],
                "contextmenu": {
                    'items': function (node) {
                        var items = $.jstree.defaults.contextmenu.items();
                        items.ccp = false;
                        return items;
                    }
                }
            });
            $('input[name="checkall_permission"]').on('click', function () {
                loadingImg('img-loading', 'start');
                var checked = this.checked;
                if (checked == true) {
                    $('input[type="checkbox"][name="is_permission_allowed[]"]').prop("checked", true);
                } else {
                    $('input[type="checkbox"][name="is_permission_allowed[]"]').prop("checked", false);
                }
                loadingImg('img-loading', 'stop');
            });
            $('input[name="checkall_menu"]').on('click', function () {
                loadingImg('img-loading', 'start');
                var checked = this.checked;
                if (checked == true) {
                    $('input[type="checkbox"][name="is_menu_allowed[]"]').prop("checked", true);
                } else {
                    $('input[type="checkbox"][name="is_menu_allowed[]"]').prop("checked", false);
                }
                loadingImg('img-loading', 'stop');
            });
            table.on('click', 'input[name="is_permission_allowed[]"]', function () {

                $('input[type="checkbox"][name="checkall_permission"]').prop("checked", false);
            });
            //table2.on('click', 'input[name="is_menu_allowed[]"]', function () {
            //    $('input[type="checkbox"][name="checkall_menu"]').prop("checked", false);
            //});
            //table.on("click", "th.select-checkbox", function () {
            //    if ($("th.select-checkbox").hasClass("selected")) {
            //        example.rows().deselect();
            //        $("th.select-checkbox").removeClass("selected");
            //    } else {
            //        example.rows().select();
            //        $("th.select-checkbox").addClass("selected");
            //    }
            //}).on("select deselect", function () {
            //    ("Some selection or deselection going on")
            //    if (example.rows({
            //        selected: true
            //    }).count() !== example.rows().count()) {
            //        $("th.select-checkbox").removeClass("selected");
            //    } else {
            //        $("th.select-checkbox").addClass("selected");
            //    }
            //});
            $('#skill').summernote();
            $('#notes').summernote();
            $('.permissions_multiselect').bootstrapDualListbox();
            var table = $('#group_permissions').DataTable({
                "sPaginationType": "bootstrap",
                "paging": true,
                "pagingType": "full_numbers",
                "pageLength": 10,
                "ordering": false,
                "serverSide": true,
                "cache": false,
                "processing": true,
                "lengthChange": true,
                "language": {
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span> '
                },
                "ajax": {
                    url: _base_extraweb_uri + '/master/user/get_list?a=1',
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    type: 'POST'
                },
                "columnDefs": [
                    {"width": "20", "targets": 0}
                ],
                "columns": [
                    {"data": "id"},
                    {"data": "name"},
                    {"data": "path"},
                    {"data": "controller"},
                    {"data": "method"},
                    {"data": "is_public"},
                    {"data": "is_allowed"},
                    {"data": "is_active"}
                ]
            });
            $('input[type="checkbox"][name="menu_option"]').on('click', function () {
                loadingImg('img-loading', 'start');
                var checked = this.checked;
                if (checked == true) {
                    var value = $(this).val();
                    switch (value) {
                        case "all":
                            $('#select_basic_menu').css({'display': 'none', 'transition': 'opacity 1s ease-out', 'opacity': '0'});
                            $('input[type="checkbox"][name="menu_option"][value="basic"]').prop("checked", false);
                            $('#select_manual_menu').css({'display': 'none', 'transition': 'opacity 1s ease-out', 'opacity': '0'});
                            $('input[type="checkbox"][name="menu_option"][value="manual"]').prop("checked", false);
                            break;
                        case "basic":
                            table_menu_select_basic();
                            $('#select_basic_menu').css({'display': 'block', 'opacity': '1'});
                            $('#select_all_menu').css({'display': 'none', 'transition': 'opacity 1s ease-out', 'opacity': '0'});
                            $('input[type="checkbox"][name="menu_option"][value="all"]').prop("checked", false);
                            $('#select_manual_menu').css({'display': 'none', 'transition': 'opacity 1s ease-out', 'opacity': '0'});
                            $('input[type="checkbox"][name="menu_option"][value="manual"]').prop("checked", false);
                            break;
                        default :
                            table_menu_select();
                            $('#select_manual_menu').css({'display': 'block', 'opacity': '1'});
                            $('#select_all_menu').css({'display': 'none', 'transition': 'opacity 1s ease-out', 'opacity': '0'});
                            $('input[type="checkbox"][name="menu_option"][value="all"]').prop("checked", false);
                            $('#select_basic_menu').css({'display': 'none', 'transition': 'opacity 1s ease-out', 'opacity': '0'});
                            $('input[type="checkbox"][name="menu_option"][value="basic"]').prop("checked", false);
                            break;
                    }
                } else {
                    $('#select_all_menu').css({'display': 'none', 'transition': 'opacity 1s ease-out', 'opacity': '0'});
                    $('#select_basic_menu').css({'display': 'none', 'transition': 'opacity 1s ease-out', 'opacity': '0'});
                    $('#select_manual_menu').css({'display': 'none', 'transition': 'opacity 1s ease-out', 'opacity': '0'});
                }
                setTimeout(function () {
                    loadingImg('img-loading', 'stop');
                }, 1200);
            });
            $('input[type="checkbox"][name="change_password"]').on('click', function (e) {
                loadingImg('img-loading', 'start');
                if ($(this).prop("checked") == true) {
                    setTimeout(function () {
                        loadingImg('img-loading', 'stop');
                        $('.change_password').css({'display': 'block'});
                    }, 700);
                } else if ($(this).prop("checked") == false) {
                    setTimeout(function () {
                        loadingImg('img-loading', 'stop');
                        $('.change_password').css({'display': 'none'});
                    }, 700);
                }
            });
            $('#submit_form').on('click', function (e) {
                e.preventDefault();
                var uri = _base_extraweb_uri + '/master/user/insert';
                var type = 'POST';
                var check_all_permissions = true;
                var arr_user_permissions = [];
                if ($('input[name="checkall_permission"]:checked')) {
                    check_all_permissions = false;
                    arr_user_permissions = getAllCheckBoxPermission();
                }
                var arr_menu_permissions = $('#treeMenu').jstree("get_selected");
                var check_all_menus = false;
                if (arr_menu_permissions[0] == 'root') {
                    check_all_menus = true;
                    arr_menu_permissions = [];
                }
                var formdata = {
                    'action': 'default',
                    'detail': {
                        'user_name': $('input[name="user_name"]').val(),
                        'first_name': $('input[name="first_name"]').val(),
                        'last_name': $('input[name="last_name"]').val(),
                        'password': Base64.encode($('input[name="password"]').val()),
                        'email': Base64.encode($('input[name="email"]').val()),
                        'description': $('textarea[name="description"]').val()
                    },
                    'profile': {
                        'address': $('textarea[name="address"]').val(),
                        'lat': $('input[name="lat"]').val(),
                        'lng': $('input[name="lng"]').val(),
                        'zoom': $('input[name="zoom"]').val(),
                        'facebook': $('input[name="facebook"]').val(),
                        'twitter': $('input[name="twitter"]').val(),
                        'instagram': $('input[name="instagram"]').val(),
                        'linkedin': $('input[name="linkedin"]').val(),
                        'last_education': $('input[name="last_education"]').val(),
                        'last_education_institution': $('input[name="last_education_institution"]').val(),
                        'skill': $('textarea[name="skill"]').val(),
                        'notes': $('textarea[name="notes"]').val()
                    },
                    'group': $('select[name="group"]').val(),
                    'user_permissions_denied_all': check_all_permissions,
                    'user_permissions_denied': arr_user_permissions,
                    'menu_permission_all': check_all_menus,
                    'menu_permissions': arr_menu_permissions,
                    'is_allowed': ($('input[type="checkbox"][name="is_allowed"]:checked').val()) ? 1 : 0,
                    'is_active': ($('input[type="checkbox"][name="is_active"]:checked').val()) ? 1 : 0
                };
                console.log(formdata);
                var response = fnAjaxSend(JSON.stringify(formdata), uri, type, {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
                if (response.responseJSON.status.code == 200) {
                    fnAlertStr(response.responseJSON.status.message, 'success', {timeOut: 2000});
                } else {
                    fnAlertStr(response.responseJSON.status.message, 'error', {timeOut: 2000});
                }
                return false;
            });
            $('#close_form_add_permission').on('click', function (e) {
                e.preventDefault();
                loadingImg('img-loading', 'start');
                setTimeout(function () {
                    loadingImg('img-loading', 'stop');
                    $('#form_new_permission').css({'display': 'none'});
                }, 700);
            });
        }
    };
}();
jQuery(document).ready(function () {
    CreateJS.init();
});
</script>