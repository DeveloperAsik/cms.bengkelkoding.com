<!-- Summernote -->
<script src="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/summernote/summernote-bs4.min.js"></script>
<!-- Select2 -->
<script src="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/select2/js/select2.full.min.js"></script>
<script>
var i = 0;
var fnGetSmartListEmail = function (search) {
    var uri = _base_extraweb_uri + '/ajax/post/get-smart-list-email';
    var formdata = {search: Base64.encode(search)};
    var response = fnAjaxSend(JSON.stringify(formdata), uri, 'POST', {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false);
    if (response.responseJSON && response.responseJSON.status.code == 200) {
        return response.responseJSON.data;
    } else {
        return [];
    }
};
var fnSubmitForm = function (uri) {
    var type = 'POST';
    var formdata = new FormData($('form#submit_compose')[0]);
    var response = fnAjaxSend(formdata, uri, type, {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, false, true);
    console.log(response);
    response = JSON.parse(response.responseText);
    if (response.status.code === 200 && response.options.valid == true) {

    }
};
var ComposeJS = function () {
    return {
        //main function to initiate the module
        init: function () {
            fnAlertStr('ComposeJS successfully load', 'success', {timeOut: 2000});
            $('#compose-textarea').summernote();
            $('select[name="to[]"]').select2({
                theme: 'bootstrap4'
            });
            $('#add_attach').on('click', function () {
                i++;
                var strHtml = '<div class="btn btn-default btn-file" data-i="' + i + '">';
                strHtml = strHtml + ' <i class="fas fa-paperclip"></i> <span class="title-' + i + '">File Attachment ' + i + '</span>';
                strHtml = strHtml + ' <input type="file" class="attachment" name="attachment[]">';
                strHtml = strHtml + ' <a href="#" class="remove" style="z-index:99999"><i class="fas fa-trash"></i></a></div>';
                $('#result_attachment').append(strHtml);
            });
            $('#result_attachment').on('change', 'input[type="file"]', function () {
                var parentId = $(this)[0].parentNode.attributes.getNamedItem('data-i').value;
                var filename = $(this).val().replace(/C:\\fakepath\\/i, '');
                $('#result_attachment > div > span.title-' + parentId).html(filename);
            });
            $('.select2-search__field').on('keyup', function (e) {
                var val = $(this).val();
                if (val.length >= 3) {
                    var data = fnGetSmartListEmail(val);
                    $('select[name="to[]"]').html('').select2({data: data});
                }
            });
            $('button[name="submit"]').on('click', function (e) {
                e.preventDefault();
                switch ($(this).val()) {
                    case "save_draft":
                        var uri = _base_extraweb_uri + '/messaging/compose?a=1';
                        fnSubmitForm(uri);
                        break;
                    case "discard_msg":
                        var uri = _base_extraweb_uri + '/messaging/compose?a=2';
                        fnSubmitForm(uri);
                        break;
                    default:
                        var uri = _base_extraweb_uri + '/messaging/compose';
                        fnSubmitForm(uri);
                        break;
                }
                return false;
            });
        }
    };
}();
jQuery(document).ready(function () {
    ComposeJS.init();
});
</script>
