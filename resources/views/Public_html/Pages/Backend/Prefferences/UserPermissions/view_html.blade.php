<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
<link href="{{config('app.base_assets_uri')}}/templates/metronic/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css">

<section class="content">
    <div class="container-fluid">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-sm-12">
                <div class="card" style="background-color:#fff; color:#000">
                    <div class="card-header">
                        <h5>{!! $_config['title_for_header'] !!}</h5>
                        <div class="card-tools">
                            @if(isset($_config['create_page']['link']))
                            <a href="{!! $_config['create_page']['link'] !!}" class="btn btn-tool" title="{!! $_config['create_page']['title'] !!}">
                                {!! $_config['create_page']['icon'] !!}
                            </a>
                            @endif
                            <a type="button" class="btn btn-tool" data-card-widget="collapse" title="minimize window">
                                <i class="fas fa-minus"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card-divider"></div>
                    <div class="card-body">
                        <div class="card-table">
                            <div class="table-responsive-sm p-3">
                                @if(isset($_table_view) && !empty($_table_view) && $_table_view == 'view_detail')
                                <table style="width:100%;background-color:#fff;color:#000; font-size:10px;" class="table table-bordered" id="detail_user_permissions">
                                    <thead>
                                        <tr role="row" class="heading">
                                            <th>ID</th>
                                            <th>Full_name</th>
                                            <th>Group Name</th>
                                            <th>permission_name</th>
                                            <th>permission_path</th>
                                            <th>permission_controller</th>
                                            <th>permission_method</th>
                                            <th>Is Denied</th>
                                            <th>Is Active</th>
                                        </tr>							
                                    </thead>
                                    <tbody></tbody>
                                </table>
                                @else
                                <table style="width:100%;background-color:#fff;color:#000; font-size:10px;" class="table table-bordered" id="user_permissions">
                                    <thead>
                                        <tr role="row" class="heading">
                                            <th>ID</th>
                                            <th>user_name</th>
                                            <th>first_name</th>
                                            <th>last_name</th>
                                            <th>email</th>
                                            <th>Is Active</th>
                                            <th>Action</th>
                                        </tr>							
                                    </thead>
                                    <tbody></tbody>
                                </table>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div><!--/. container-fluid -->
</section>