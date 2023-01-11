<section class="content">
    <div class="container-fluid">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-12">
                <div class="card">
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
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <form class="form-horizontal">
                                    <div class="card-body">
                                        @php $disabled = ''; @endphp
                                        @if(isset($untouchable) && !empty($untouchable) && $untouchable == 1)
                                            @php $disabled = ' disabled=""'; @endphp
                                        @endif
                                        <div class="form-group row">
                                            <label for="id" class="col-sm-2 control-label">ID</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="id" class="form-control" id="id" placeholder="id" value="{{base64_encode($user->id)}}" disabled>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group row">
                                            <label for="email" class="col-sm-2 control-label">Email</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="email" class="form-control" value="{{$user->email}}" id="email" placeholder="email" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="user_name" class="col-sm-2 control-label">User name</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="user_name" class="form-control" value="{{$user->user_name}}" id="user_name" placeholder="user_name"{{$disabled}}>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group row">
                                            <label for="first_name" class="col-sm-2 control-label">First name</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="first_name" class="form-control" value="{{$user->first_name}}" id="first_name" placeholder="first_name"{{$disabled}}>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group row">
                                            <label for="last_name" class="col-sm-2 control-label">Last name</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="last_name" class="form-control" value="{{$user->last_name}}" id="last_name" placeholder="last_name"{{$disabled}}>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group row">
                                            <label for="description" class="col-sm-2 control-label">description</label>
                                            <div class="col-sm-10">
                                                <textarea class="form-control" name="description" id="description"{{$disabled}}>{{$user->description}}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="group_id" class="col-sm-2 control-label">Groups</label>
                                            <div class="col-sm-10">
                                                <select class="form-control" name="group_id"{{$disabled}}>
                                                    @if($user->group_id == null)
                                                        <option value="0" selected>-- select one --</option>
                                                    @endif
                                                    @if(isset($groups['data']) && !empty($groups['data']))
                                                        @foreach($groups['data'] AS $keyword => $value)
                                                            @if(isset($user->group_id) && !empty($user->group_id) && $user->group_id == $value->id)
                                                                <option value="{{$user->group_id}}" selected>{{$user->group_name}}</option>
                                                            @else
                                                                <option value="{{$value->id}}">{{$value->name}}</option>
                                                            @endif
                                                        @endforeach
                                                    @endif
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.card-body -->
                                    <div class="card-footer">
                                        <input type="text" value="{{$id}}" name="id" hidden/>
                                        <input type="text" value="{{$user->user_group_id}}" name="user_group_id" hidden/>
                                        <button type="submit" id="submit_form" class="btn btn-info"{{$disabled}}>Submit</button>
                                    </div>
                                    <!-- /.card-footer -->
                                </form>
                            </div>
                            <!-- /.col -->
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- ./card-body -->
                    <!-- /.card-footer -->
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
        <!-- /.row -->
    </div><!--/. container-fluid -->
</section>