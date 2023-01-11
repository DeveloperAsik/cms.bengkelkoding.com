<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
<link href="{{config('app.base_assets_uri')}}/templates/metronic/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css">
<section class="content">
    <div class="container-fluid">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-sm-12">
                @if(isset($page) && !empty($page) && $page == 'detail-group-permission')
                <div class="card" style="background-color:#fff; color:#000">
                    <div class="card-header">
                        <h5>{!! isset($_config['title_for_header']) ? $_config['title_for_header'] : '' !!}</h5>
                        <div class="card-tools">
                            <a href="{!! $_config['create_page']['link'] !!}" class="btn btn-tool" title="{!! $_config['create_page']['title'] !!}">
                                {!! $_config['create_page']['icon'] !!}
                            </a>
                            <a type="button" class="btn btn-tool" data-card-widget="collapse" title="minimize window">
                                <i class="fas fa-minus"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card-divider"></div>
                    <div class="card-table">
                        <div class="table-responsive-sm p-3">
                            <table style="width:100%;background-color:#fff;color:#000; font-size:10px;" class="table table-bordered" id="group_permissions">
                                <thead>
                                    <tr role="row" class="heading">
                                        <th>ID</th>
                                        <th>Group</th>
                                        <th>Module</th>
                                        <th>Permission</th>
                                        <th>Permission Path</th>
                                        <th>Permission Controller</th>
                                        <th>Permission Method</th>
                                        <th>Is Allowed</th>
                                        <th>Is Active</th>
                                    </tr>							
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                @elseif(isset($page) && !empty($page) && $page == 'detail-menu-permission')
                <div class="card" style="background-color:#fff; color:#000">
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
                    <div class="card-divider"></div>
                    <div class="card-body">
                        <div class="card-table">
                            <div class="table-responsive-sm p-3">
                                <table style="width:100%;background-color:#fff;color:#000; font-size:14px;" class="table table-bordered" id="menuPermission">
                                    <thead>
                                        <tr role="row" class="heading">
                                            <th>ID</th>
                                            <th>Parent Name</th>
                                            <th>Name</th>
                                            <th>Level</th>
                                            <th>Rank</th>
                                            <th>Is Allowed</th>
                                            <th>Status</th>
                                        </tr>							
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                @else
                <div class="card" style="background-color:#fff; color:#000">
                    <div class="card-header">
                        <h5>{!! isset($_config['title_for_header']) ? $_config['title_for_header'] : '' !!}</h5>
                        <div class="card-tools">
                            <a href="{!! $_config['create_page']['link'] !!}" class="btn btn-tool" title="{!! $_config['create_page']['title'] !!}">
                                {!! $_config['create_page']['icon'] !!}
                            </a>
                            <a type="button" class="btn btn-tool" data-card-widget="collapse" title="minimize window">
                                <i class="fas fa-minus"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card-divider"></div>
                    <div class="card-table">
                        <div class="table-responsive-sm p-3">
                            <table style="width:100%;background-color:#fff;color:#000; font-size:10px;" class="table table-bordered" id="group_permissions2">
                                <thead>
                                    <tr role="row" class="heading">
                                        <th>ID</th>
                                        <th>Parent Group</th>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>Rank</th>
                                        <th>Group Project</th>
                                        <th>Menu</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>							
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                @endif
            </div>
        </div>
        <!-- /.row -->
    </div><!--/. container-fluid -->
</section>