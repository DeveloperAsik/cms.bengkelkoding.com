<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
<style>
    th:last-child, td:last-child {
        text-align: center;
    }
</style>
<section class="content">
    <div class="container-fluid">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-sm-12">
                <div class="card" style="background-color:#fff; color:#000">
                    <div class="card-header">
                        <h5 class="card-title">{!! $_config['title_for_header'] !!}</h5>
                        <div class="card-tools">
                            <a href="#" id="link_generate" data-url="{!! $_config['create_page']['link'] !!}" class="btn btn-tool" title="{!! $_config['create_page']['title'] !!}">
                                {!! $_config['create_page']['icon'] !!}
                            </a>
                            <button class="btn btn-tool" data-card-widget="collapse" title="minimize window">
                                <i class="fas fa-minus"></i>
                            </button>
                        </div>
                    </div>
                    <div class="card-divider"></div>
                    <div class="card-body">
                        @if(isset($_config['create_page']['link']) && !empty($_config['create_page']['link']))
                        <div class="progress">
                            <div id="generate_progress" class="progress-bar bg-primary progress-bar-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                <span class="sr-only">40% Complete (success)</span>
                            </div>
                        </div>
                        @endif
                        <div class="card-table">
                            <div class="table-responsive-sm p-3">
                                <table style="width:100%;background-color:#fff;color:#000; font-size:14px;" class="table table-bordered" id="group_permission_scheme">
                                    <thead>
                                        <tr role="row" class="heading">
                                            <th>ID</th>
                                            <th>Group Name</th>
                                            <th>Permission Name</th>
                                            <th>Permission Controller</th>
                                            <th>Permission Method</th>
                                            <th>is_basic</th>
                                            <th>is_public</th>
                                            <th>
                                                <label for="is_active" class="control-label">Check All</label>
                                                <input type="checkbox" name="selectAll" value="1" > 
                                            </th>
                                        </tr>							
                                    </thead>
                                    <tbody></tbody>
                                    <tfoot>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th><button type="button" id="apply_checkbox" class="btn btn-primary">Apply</button></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div><!--/. container-fluid -->
</section>
