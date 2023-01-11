<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<!-- Summernote -->
<script src="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/summernote/summernote-bs4.min.js"></script>
<script>
var InboxJS = function () {
    return {
        //main function to initiate the module
        init: function () {
            fnAlertStr('InboxJS successfully load', 'success', {timeOut: 2000});
            var table = $('#inbox').DataTable({
                "sPaginationType": "bootstrap",
                "paging": true,
                "pagingType": "full_numbers",
                "pageLength": 10,
                "ordering": false,
                "serverSide": true,
                "cache": false,
                "processing": true,
                "lengthChange": true,
                "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "1000"]],
                "language": {
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span> '
                },
                "ajax": {
                    url: _base_extraweb_uri + '/messaging/inbox/get_list?a=1',
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    type: 'POST'
                },
                "columns": [
                    {"data": "data"}
                ]
            });
            $('#inbox').on('click','.mailbox-attachment', function(){
                $('#modal_attachment_mail').modal('show');
            });
            //Enable check and uncheck all functionality
            $('.checkbox-toggle').click(function () {
                var clicks = $(this).data('clicks')
                if (clicks) {
                    //Uncheck all checkboxes
                    $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
                    $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
                } else {
                    //Check all checkboxes
                    $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
                    $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
                }
                $(this).data('clicks', !clicks)
            });

            //Handle starring for glyphicon and font awesome
            $('.mailbox-star').click(function (e) {
                e.preventDefault()
                //detect type
                var $this = $(this).find('a > i')
                var glyph = $this.hasClass('glyphicon')
                var fa = $this.hasClass('fa')

                //Switch states
                if (glyph) {
                    $this.toggleClass('glyphicon-star')
                    $this.toggleClass('glyphicon-star-empty')
                }

                if (fa) {
                    $this.toggleClass('fa-star')
                    $this.toggleClass('fa-star-o')
                }
            });
        }
    };
}();
jQuery(document).ready(function () {
    InboxJS.init();
});
</script>
