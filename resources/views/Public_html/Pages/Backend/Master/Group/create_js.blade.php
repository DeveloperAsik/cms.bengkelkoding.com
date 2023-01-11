<script src="{{config('app.base_assets_uri')}}/templates/metronic/assets/global/plugins/jstree/dist/jstree.min.js"></script>
<!-- Select2 -->
<script src="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<script>
var fnGetTreeMenu = function () {
    var group_id = '{{$__group_id}}';
    var module_id = '{{$__module_id}}';
    loadingImg('img-loading', 'start');
    var uri = _base_extraweb_uri + '/master/menu/get_list?a=1&module_id=' + module_id + '&group_id=' + group_id;
    var response = fnAjaxSend({}, uri, "POST", {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
    if (response.responseJSON.status.code == 200) {
        $("#tree_menu").jstree({
            "core": {
                "themes": {
                    "responsive": false
                },
                "check_callback": true,
                "data": response.responseJSON.data
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
            "checkbox": {
                "keep_selected_style": true
            },
            "plugins": ["checkbox","contextmenu", "dnd", "state", "types"],
            "contextmenu": {
                'items': function (node) {
                    var items = $.jstree.defaults.contextmenu.items();
                    items.ccp = false;
                    return items;
                }
            }
        });
    }
    loadingImg('img-loading', 'stop');
};
var EditJS = function () {
    return {
        //main function to initiate the module
        init: function () {
            fnAlertStr('EditJS successfully load', 'success', {timeOut: 2000});
            $('.permission_multiselect').bootstrapDualListbox();
            $('.menu_multiselect').bootstrapDualListbox();
            fnGetTreeMenu();
            $('#submit_form_add').on('click', function (e) {
                e.preventDefault();
                var uri = _base_extraweb_uri + '/master/group/insert';
                var type = 'POST';
                var selectedElmsIds = $('#tree_menu').jstree("get_selected");
                var formdata = {
                    name: $('input[name="name"]').val(),
                    permission: $('select[name="permission[]"]').val(),
                    menu: selectedElmsIds,
                    description: $('textarea[name="description"]').val(),
                    is_group_project: $('input[type="checkbox"][name="check"][value="is_group_project"]')[0].checked,
                    is_menu: $('input[type="checkbox"][name="check"][value="is_menu"]')[0].checked,
                    is_active: $('input[type="checkbox"][name="check"][value="is_active"]')[0].checked
                };
                console.log(formdata);
                var response = fnAjaxSend(JSON.stringify(formdata), uri, type, {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
                if (response.responseJSON.status.code === 200) {
                    setTimeout(function () {
                        loadingImg('img-loading', 'stop');
                        fnAlertStr(response.responseJSON.status.message, 'success', {timeOut: 2000});
                    }, 1500);
                } else {
                    setTimeout(function () {
                        loadingImg('img-loading', 'stop');
                        fnAlertStr(response.responseJSON.status.message, 'error', {timeOut: 2000});
                    }, 1500);
                }
                return false;
            });
        }
    };
}();
jQuery(document).ready(function () {
    EditJS.init();
});
</script>
