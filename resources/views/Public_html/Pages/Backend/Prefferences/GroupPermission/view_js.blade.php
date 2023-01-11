<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<script src="{{config('app.base_assets_uri')}}/templates/metronic/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script src="{{config('app.base_assets_uri')}}/templates/metronic/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script>
var ViewJS = function () {
    return {
        //main function to initiate the module
        init: function () {
            fnAlertStr('ViewJS successfully load', 'success', {timeOut: 700});
            if (page && page == 'detail-group-permission') {
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
                    "lengthMenu": [[10, 25, 50, 100, 150, 200, 500, -1], [10, 25, 50, 100, 150, 200, 500, "1000"]],
                    "language": {
                        processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span> '
                    },
                    "ajax": {
                        url: _base_extraweb_uri + '/prefferences/group/permissions/get_list?a=2&id=' + id,
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        type: 'POST'
                    },
                    "columns": [
                        {"data": "id"},
                        {"data": "group_name"},
                        {"data": "module_name"},
                        {"data": "permission_name"},
                        {"data": "permission_path"},
                        {"data": "permission_controller"},
                        {"data": "permission_method"},
                        {"data": "is_allowed"},
                        {"data": "is_active"}
                    ]
                });
            } else if (page && page == 'detail-menu-permission') {
                var table = $('#menuPermission').DataTable({
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
                        url: _base_extraweb_uri + '/prefferences/group/permissions/get_list?a=3&id=' + id,
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        type: 'POST'
                    },
                    "columns": [
                        {"data": "id"},
                        {"data": "parent_name"},
                        {"data": "name"},
                        {"data": "level"},
                        {"data": "rank"},
                        {"data": "is_allowed"},
                        {"data": "status"}
                    ]
                });
            } else {
                var table = $('#group_permissions2').DataTable({
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
                        url: _base_extraweb_uri + '/prefferences/group/permissions/get_list?a=1',
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        type: 'POST'
                    },
                    "columns": [
                        {"data": "id"},
                        {"data": "parent_name"},
                        {"data": "name"},
                        {"data": "description"},
                        {"data": "rank"},
                        {"data": "group_project"},
                        {"data": "menu"},
                        {"data": "status"},
                        {"data": "action"}
                    ]
                });
            }
            $('#group_permissions2').on('click', 'input[type="checkbox"][name="is_active"]', function () {
                loadingImg('img-loading', 'start');
                var checked = this.checked;
                var id = $(this).attr('data-id');
                var uri = _base_extraweb_uri + '/prefferences/group/permissions/update/' + id;
                var type = 'POST';
                var formdata = {
                    action: 'is_active',
                    is_active: (checked == true) ? 1 : 0
                };
                var response = fnAjaxSend(JSON.stringify(formdata), uri, type, {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
                if (response.responseJSON.status.code == 200) {
                    fnAlertStr(response.responseJSON.status.message, 'success', {timeOut: 700});
                } else {
                    fnAlertStr(response.responseJSON.status.message, 'error', {timeOut: 700});
                }
                loadingImg('img-loading', 'stop');
            });

            $('#group_permissions').on('click', 'input[type="checkbox"][name="is_allowed"]', function () {
                loadingImg('img-loading', 'start');
                var checked = this.checked;
                var id = $(this).attr('data-id');
                setTimeout(function () {
                    var uri = _base_extraweb_uri + '/prefferences/group/permissions/update/' + id + '?a=1';
                    var type = 'POST';
                    var formdata = {
                        action: 'is_allowed',
                        is_allowed: (checked == true) ? 1 : 0
                    };
                    var response = fnAjaxSend(JSON.stringify(formdata), uri, type, {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
                    if (response.responseJSON.status.code == 200) {
                        fnAlertStr(response.responseJSON.status.message, 'success', {timeOut: 700});
                    } else {
                        fnAlertStr(response.responseJSON.status.message, 'error', {timeOut: 700});
                    }
                    loadingImg('img-loading', 'stop');
                }, 800);
            });

            $('#group_permissions').on('click', 'input[type="checkbox"][name="is_active"]', function () {
                loadingImg('img-loading', 'start');
                var checked = this.checked;
                var id = $(this).attr('data-id');
                setTimeout(function () {
                    var uri = _base_extraweb_uri + '/prefferences/group/permissions/update/' + id + '?a=2';
                    var type = 'POST';
                    var formdata = {
                        action: 'is_active',
                        is_active: (checked == true) ? 1 : 0
                    };
                    var response = fnAjaxSend(JSON.stringify(formdata), uri, type, {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
                    if (response.responseJSON.status.code == 200) {
                        fnAlertStr(response.responseJSON.status.message, 'success', {timeOut: 700});
                    } else {
                        fnAlertStr(response.responseJSON.status.message, 'error', {timeOut: 700});
                    }
                    loadingImg('img-loading', 'stop');
                }, 800);
            });


            $('#menuPermission').on('click', 'input[type="checkbox"][name="is_allowed"]', function () {
                loadingImg('img-loading', 'start');
                var checked = this.checked;
                var id = $(this).attr('data-id');
                setTimeout(function () {
                    var uri = _base_extraweb_uri + '/prefferences/group/permissions/update/' + id + '?a=3';
                    var type = 'POST';
                    var formdata = {
                        action: 'is_allowed',
                        is_allowed: (checked == true) ? 1 : 0
                    };
                    var response = fnAjaxSend(JSON.stringify(formdata), uri, type, {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
                    if (response.responseJSON.status.code == 200) {
                        fnAlertStr(response.responseJSON.status.message, 'success', {timeOut: 700});
                    } else {
                        fnAlertStr(response.responseJSON.status.message, 'error', {timeOut: 700});
                    }
                    loadingImg('img-loading', 'stop');
                }, 800);
            });

            $('#menuPermission').on('click', 'input[type="checkbox"][name="is_active"]', function () {
                loadingImg('img-loading', 'start');
                var checked = this.checked;
                var id = $(this).attr('data-id');
                setTimeout(function () {
                    var uri = _base_extraweb_uri + '/prefferences/group/permissions/update/' + id + '?a=4';
                    var type = 'POST';
                    var formdata = {
                        action: 'is_active',
                        is_active: (checked == true) ? 1 : 0
                    };
                    var response = fnAjaxSend(JSON.stringify(formdata), uri, type, {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
                    if (response.responseJSON.status.code == 200) {
                        fnAlertStr(response.responseJSON.status.message, 'success', {timeOut: 700});
                    } else {
                        fnAlertStr(response.responseJSON.status.message, 'error', {timeOut: 700});
                    }
                    loadingImg('img-loading', 'stop');
                }, 800);
            });
        }
    };
}();
jQuery(document).ready(function () {
    ViewJS.init();
});
</script>