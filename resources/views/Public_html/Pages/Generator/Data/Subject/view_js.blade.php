<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<script>
    var ViewJS = function () {
        return {
            //main function to initiate the module
            init: function () {
                fnAlertStr('ViewJS successfully load', 'success', {timeOut: 2000});
                var table = $('#project_type').DataTable({
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
                        url: _base_extraweb_uri + '/generator/data/subject/get_list',
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        type: 'POST'
                    },
                    "columns": [
                        {"data": "id"},
                        {"data": "code"},
                        {"data": "name"},
                        {"data": "description"},
                        {"data": "status"},
                        {"data": "action"}
                    ]
                });
                $('#project_type').on('click', 'input[type="checkbox"][name="is_group_project"]', function (e) {
                    loadingImg('img-loading', 'start');
                    var checked = this.checked;
                    var uri = _base_extraweb_uri + '/master/group/update/' + $(this).attr('data-id');
                    var type = 'POST';
                    var formdata = {
                        is_group_project: (checked == true) ? 1 : 0,
                        action: 'is_group_project'
                    };
                    var response = fnAjaxSend(JSON.stringify(formdata), uri, type, {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
                    if (response.responseJSON.status.code === 200) {
                        setTimeout(function () {
                            loadingImg('img-loading', 'stop');
                            fnAlertStr(response.responseJSON.status.message, 'success', {timeOut: 2000});
                        }, 1200);
                    } else {
                        setTimeout(function () {
                            loadingImg('img-loading', 'stop');
                            fnAlertStr(response.responseJSON.status.message, 'error', {timeOut: 2000});
                        }, 1200);
                    }
                });
                $('#project_type').on('click', 'input[type="checkbox"][name="is_menu"]', function (e) {
                    loadingImg('img-loading', 'start');
                    var checked = this.checked;
                    var uri = _base_extraweb_uri + '/master/group/update/' + $(this).attr('data-id');
                    var type = 'POST';
                    var formdata = {
                        is_menu: (checked == true) ? 1 : 0,
                        action: 'is_menu'
                    };
                    var response = fnAjaxSend(JSON.stringify(formdata), uri, type, {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
                    if (response.responseJSON.status.code === 200) {
                        setTimeout(function () {
                            loadingImg('img-loading', 'stop');
                            fnAlertStr(response.responseJSON.status.message, 'success', {timeOut: 2000});
                        }, 1200);
                    } else {
                        setTimeout(function () {
                            loadingImg('img-loading', 'stop');
                            fnAlertStr(response.responseJSON.status.message, 'error', {timeOut: 2000});
                        }, 1200);
                    }
                });
                $('#project_type').on('click', 'input[type="checkbox"][name="is_active"]', function (e) {
                    loadingImg('img-loading', 'start');
                    var checked = this.checked;
                    var uri = _base_extraweb_uri + '/master/group/update/' + Base64.encode($(this).attr('data-id'));
                    var type = 'POST';
                    var formdata = {
                        is_active: (checked == true) ? 1 : 0,
                        action: 'is_active'
                    };
                    var response = fnAjaxSend(JSON.stringify(formdata), uri, type, {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
                    if (response.responseJSON.status.code === 200) {
                        setTimeout(function () {
                            loadingImg('img-loading', 'stop');
                            fnAlertStr(response.responseJSON.status.message, 'success', {timeOut: 2000});
                        }, 1200);
                    } else {
                        setTimeout(function () {
                            loadingImg('img-loading', 'stop');
                            fnAlertStr(response.responseJSON.status.message, 'error', {timeOut: 2000});
                        }, 1200);
                    }
                });
            }
        };
    }();
    jQuery(document).ready(function () {
        ViewJS.init();
    });
</script>
