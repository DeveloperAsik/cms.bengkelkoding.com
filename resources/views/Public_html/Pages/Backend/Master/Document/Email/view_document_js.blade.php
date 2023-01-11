<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<script>
    var ViewDocumentJS = function () {
        return {
            //main function to initiate the module
            init: function () {
                fnAlertStr('ViewDocumentJS successfully load', 'success', {timeOut: 2000});
                var table = $('#users').DataTable({
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
                        url: _base_extraweb_uri + '/project/documents/get_list',
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        type: 'POST'
                    },
                    "columns": [
                        {"data": "id"},
                        {"data": "document_name"},
                        {"data": "document_path"},
                        {"data": "project_code"},
                        {"data": "project_name"},
                        {"data": "status"},
                        {"data": "action"}
                    ]
                });
            }
        };
    }();
    jQuery(document).ready(function () {
        ViewDocumentJS.init();
    });
</script>
