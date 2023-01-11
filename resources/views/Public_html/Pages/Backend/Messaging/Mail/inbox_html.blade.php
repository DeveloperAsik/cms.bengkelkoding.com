<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
<!-- summernote -->
<link rel="stylesheet" href="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/summernote/summernote-bs4.css">
<style>
    .table td  {
        vertical-align: middle !important;
    }
</style>
<!-- Main content -->
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                @include('Public_html.Widgets.Backend.sidebar.sidebar_messaging')
            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h5>{!! $_config['title_for_header'] !!}</h5>
                        <div class="card-tools">
                            <a href="{!! $_config['create_page']['link'] !!}" class="btn btn-tool" title="{!! $_config['create_page']['title'] !!}">
                                {!! $_config['create_page']['icon'] !!}
                            </a>
                            <a type="button" class="btn btn-tool" data-card-widget="collapse" title="minimize window">
                                <i class="fas fa-minus"></i>
                            </a>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                        <div class="mailbox-controls">
                            <!-- Check all button -->
                            <button type="button" name="checkAll" class="btn btn-default btn-sm checkbox-toggle"><i class="far fa-square"></i>
                            </button>
                            <div class="btn-group">
                                <button type="button" class="btn btn-default btn-sm" disabled=""><i class="far fa-trash-alt"></i></button>
                                <button type="button" class="btn btn-default btn-sm" disabled=""><i class="fas fa-reply"></i></button>
                                <button type="button" class="btn btn-default btn-sm" disabled=""><i class="fas fa-share"></i></button>
                            </div>
                            <!-- /.btn-group -->
                            <button type="button" class="btn btn-default btn-sm"><i class="fas fa-sync-alt"></i></button>
                            <div class="float-right"></div>
                            <!-- /.float-right -->
                        </div>
                        <div class="card-table">
                            <div class="table-responsive-sm p-3">
                                <div class="table-responsive mailbox-messages">
                                    <table class="table table-hover table-striped" id="inbox">
                                        <thead>
                                            <tr role="row" class="heading">
                                                <th></th>
                                            </tr>							
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                    <!-- /.table -->
                                </div>
                                <!-- /.mail-box-messages -->
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer p-0">
                        <div class="mailbox-controls">
                            <!-- Check all button -->
                            <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="far fa-square"></i>
                            </button>
                            <div class="btn-group">
                                <button type="button" class="btn btn-default btn-sm" disabled=""><i class="far fa-trash-alt"></i></button>
                                <button type="button" class="btn btn-default btn-sm" disabled=""><i class="fas fa-reply"></i></button>
                                <button type="button" class="btn btn-default btn-sm" disabled=""><i class="fas fa-share"></i></button>
                            </div>
                            <!-- /.btn-group -->
                            <button type="button" class="btn btn-default btn-sm"><i class="fas fa-sync-alt"></i></button>
                            <div class="float-right"></div>
                            <!-- /.float-right -->
                        </div>
                    </div>
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div><!-- /.container-fluid -->
</section>
<!-- /.content -->