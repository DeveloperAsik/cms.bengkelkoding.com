<script>

    var LogsJS = function () {
        return {
            //main function to initiate the module
            init: function () {
                fnAlertStr('LogsJS successfully load', 'success', {timeOut: 2000});
            }
        };
    }();
    jQuery(document).ready(function () {
        LogsJS.init();
    });
</script>