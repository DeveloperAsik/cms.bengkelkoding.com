<!-- Font Awesome -->
<link rel="stylesheet" href="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- fullCalendar -->
<link rel="stylesheet" href="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/fullcalendar/main.min.css">
<link rel="stylesheet" href="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/fullcalendar-daygrid/main.min.css">
<link rel="stylesheet" href="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/fullcalendar-timegrid/main.min.css">
<link rel="stylesheet" href="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/fullcalendar-bootstrap/main.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="{{config('app.base_assets_uri')}}/templates/adminlte/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

<!-- SweetAlert2 -->
<link rel="stylesheet" href="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
<!-- Toastr -->
<link rel="stylesheet" href="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/toastr/toastr.min.css">


@if(isset($load_css) && !empty($load_css))
@foreach ($load_css AS $key => $values)
<link href="{{$_config_lib_url . $values}}" rel="stylesheet" type="text/css"/>
@endforeach
@endif
<style>
    #eMsg{
        text-align: center
    }
    .bootstrap-duallistbox-container select{
        width: 100%;
        height: 290px !important;
        padding: 0;
    }
</style>