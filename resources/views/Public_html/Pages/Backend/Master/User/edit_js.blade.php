<script>
    var EditJS = function () {
        return {
            //main function to initiate the module
            init: function () {
                fnAlertStr('EditJS successfully load', 'success', {timeOut: 2000});
                $('#submit_form').on('click', function (e) {
                    e.preventDefault();
                    loadingImg('img-loading', 'start');
                    var id = ($('input[name="id"]').val());
                    var uri = _base_extraweb_uri + '/master/user/update/' + id + '?a=0';
                    var type = 'POST';
                    var formdata = {
                        'user_group_id': $('input[name="user_group_id"]').val(),
                        'user_name': $('input[name="user_name"]').val(),
                        'first_name': $('input[name="first_name"]').val(),
                        'last_name': $('input[name="last_name"]').val(),
                        'description': $('textarea[name="description"]').val(),
                        'group_id': $('select[name="group_id"]').val(),
                    };
                    var response = fnAjaxSend(JSON.stringify(formdata), uri, type, {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
                    if (response.responseJSON.status.code == 200) {
                        fnAlertStr(response.responseJSON.status.message, 'success', {timeOut: 2000});
                    } else {
                        fnAlertStr(response.responseJSON.status.message, 'error', {timeOut: 2000});
                    }
                    loadingImg('img-loading', 'stop');
                    return false;
                });
            }
        };
    }();
    jQuery(document).ready(function () {
        EditJS.init();
    });
</script>
