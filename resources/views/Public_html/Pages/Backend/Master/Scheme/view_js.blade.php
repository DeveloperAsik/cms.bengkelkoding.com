<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<script>
    var ViewJS = function () {
        return {
            //main function to initiate the module
            init: function () {
                fnAlertStr('ViewJS successfully load', 'success', {timeOut: 2000});
                var table = $('#group_permission_scheme').DataTable({
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
                        url: _base_extraweb_uri + '/master/group/scheme/get_list?id=' + id,
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        type: 'POST'
                    },
                    "columns": [
                        {"data": "id"},
                        {"data": "group_name"},
                        {"data": "permission_name"},
                        {"data": "permission_controller"},
                        {"data": "permission_method"},
                        {"data": "is_basic"},
                        {"data": "is_public"},
                        {"data": "status"}
                    ]
                });
                $('#group_permission_scheme').on('click', 'input[type="checkbox"][name="selectAll"]', function (e) {
                    var checked = this.checked;
                    if (checked == false) {
                        $('input[type="checkbox"][name="allowed[]"]').prop('checked', false);
                    } else {
                        $('input[type="checkbox"][name="allowed[]"]').prop('checked', true);
                    }
                });
                $('#apply_checkbox').on('click', function () {
                    var check = $('input[type="checkbox"][name="allowed[]"]');
                    var formdata = [];
                    for (var i = 0; i < check.length; i++) {
                        console.log(check[i].getAttribute("data-id"));
                        formdata.push({
                            'group_scheme_id': check[i].getAttribute("data-id"),
                            'checked': (check[i].value == 'on') ? 1 : 0,
                            'action': 'is_allowed'
                        });
                    }
                    var uri = _base_extraweb_uri + '/master/group/scheme/update/' + id;
                    var response = fnAjaxSend(JSON.stringify(formdata), uri, 'POST', {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
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
                $('a#link_generate').on('click', function (e) {
                    e.preventDefault();
                    loadingImg('img-loading', 'start');
                    var uri = $(this).attr('data-url');
                    var response = fnAjaxSend({}, uri, 'GET', {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
                    var s = 0;
                    var IntervalProgress = setInterval(function () {
                        s = s + 5;
                        for (var i = 0; i <= 100; i++) {
                            if (i == s) {
                                i = i + 10;
                                $('#generate_progress').attr('aria-valuenow', i);
                                $('#generate_progress').css({'width': i + '%'});
                            }
                        }
                    }, 500);
                    setTimeout(function () {
                        if (response.responseJSON.status.code === 200 && response.responseJSON.options.valid == true) {
                            clearInterval(IntervalProgress);
                            $('#generate_progress').attr('aria-valuenow', 100);
                            $('#generate_progress').css({'width': '100%'});
                            $('#group_permission_scheme').DataTable().ajax.reload();
                            $('#link_generate').css({'display': 'none'});
                            loadingImg('img-loading', 'stop');
                            fnAlertStr(response.responseJSON.status.message, 'success', {timeOut: 2000});
                        }
                    }, 4000);
                });
            }
        };
    }();
    jQuery(document).ready(function () {
        ViewJS.init();
    });
</script>
