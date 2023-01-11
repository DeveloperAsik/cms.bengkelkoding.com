<link rel="stylesheet" type="text/css" href="{{config('app.base_assets_uri')}}/templates/metronic/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
<!-- Select2 -->
<link rel="stylesheet" href="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/select2/css/select2.min.css">
<link rel="stylesheet" href="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
<!-- Bootstrap4 Duallistbox -->
<link rel="stylesheet" href="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
<style>
    .select2-container {
        box-sizing: border-box;
        margin: 0px 0px 0px 6px;
        position: relative;
        width: 82% !important;
    }
</style>
<section class="content">
    <div class="container-fluid">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-12">
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
                    <div class="card-body">
                        <ul class="nav nav-tabs" id="custom-content-above-tab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="custom-content-above-home-tab" data-toggle="pill" href="#custom-content-above-home" role="tab" aria-controls="custom-content-above-home" aria-selected="true">General</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="custom-content-above-profile-tab" data-toggle="pill" href="#custom-content-above-profile" role="tab" aria-controls="custom-content-above-profile" aria-selected="false">Permission</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="custom-content-above-tabContent">
                            <div class="tab-pane fade show active" id="custom-content-above-home" role="tabpanel" aria-labelledby="custom-content-above-home-tab">
                                <form class="form-horizontal">
                                    <div class="card-body">
                                        <div class="form-group row">
                                            <label for="group" class="col-sm-2 control-label">Parent Group</label>
                                            <div class="col-sm-10">
                                                <select class="form-control" name="group_id">
                                                    @if(isset($group_exist['data']) && !empty($group_exist['data']))
                                                    @foreach($group_exist['data'] AS $keyword => $value)
                                                    @if($value->parent_id == 0)
                                                    <option value="{{$value->id}}">{{$value->name}}</option>
                                                    @elseif($value->parent_id >= 0)
                                                    <option value="{{$value->id}}"> -- {{$value->parent_name . ' -- #' . $value->id . ' ' . $value->name}}</option>
                                                    @endif
                                                    @endforeach
                                                    @endif
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="name" class="col-sm-2 control-label">Name</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="name" class="form-control" id="name" placeholder="name">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="description" class="col-sm-2 control-label">Description</label>
                                            <div class="col-sm-10">
                                                <textarea class="form-control" name="description" id="description" name="description" ></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="is_group_project" class="col-sm-2 control-label">Is Group Project</label>
                                            <div class="col-sm-10">
                                                <input type="checkbox" name="check" value="is_group_project"> 
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="is_menu" class="col-sm-2 control-label">Is Menu</label>
                                            <div class="col-sm-10">
                                                <input type="checkbox" name="check" value="is_menu"> 
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="is_active" class="col-sm-2 control-label">Is Active</label>
                                            <div class="col-sm-10">
                                                <input type="checkbox" name="check" value="is_active"> 
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.card-body -->
                                    <div class="card-footer">
                                        <button type="submit" id="submit_form_add" class="btn btn-info">Submit</button>
                                    </div>
                                    <!-- /.card-footer -->
                                </form>
                            </div>
                            <div class="tab-pane fade" id="custom-content-above-profile" role="tabpanel" aria-labelledby="custom-content-above-profile-tab">
                                <div class="form-group row">
                                    <label for="method" class="col-sm-2 control-label">Group Permission</label>
                                    <div class="col-sm-10">
                                        <select class="form-control permission_multiselect" name="permission[]" multiple="multiple">
                                            @if(isset($permissions['data']) && !empty($permissions['data']))
                                            @foreach($permissions['data'] AS $keyword => $value)
                                            @php $selected = ''; $title= '';@endphp
                                            @if($value->is_basic == 1)
                                            @php $selected = ' selected=selected';$title= ' (default)'; @endphp
                                            @endif 
                                            <option value="{{$value->id}}"{{$selected}}>{{$value->name . $title}}</option>
                                            @endforeach
                                            @endif
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="menu" class="col-sm-2 control-label">Menu Permission</label>
                                    <div class="col-sm-10">
                                        <div id="tree_menu" class="tree-demo"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
        <!-- /.row -->
    </div><!--/. container-fluid -->
</section>