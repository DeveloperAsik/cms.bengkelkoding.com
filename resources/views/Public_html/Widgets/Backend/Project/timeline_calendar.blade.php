<style>
    .ui-datepicker{
        z-index:9999 !important;
    }
    .fc-event, .fc-event-dot {
        background-color: inherit;
    }
</style>
<!-- Main content -->
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <div class="sticky-top mb-3">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Draggable Events</h4>
                        </div>
                        <div class="card-body">
                            <div id="external-events">
                                @if(isset($timeline_events['data']) && !empty($timeline_events['data']))
                                    @foreach($timeline_events['data'] AS $key => $val)
                                        <div class="external-event" id="event-{{$val->id}}" data-bgcolor="{{$val->color}}" data-color="#fff" data-event_id="{{$val->id}}" style="color:#fff; background-color:{{isset($val->color) ? str_replace(' ','-',$val->color) : 'rgb(69,73,74)'}}">{{$val->name}}</div>
                                    @endforeach
                                @endif
                                <div class="checkbox">
                                    <label for="drop-remove">
                                        <input type="checkbox" id="drop-remove">
                                        remove after drop
                                    </label>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Create Event</h3>
                        </div>
                        <div class="card-body">
                            <!-- /btn-group -->
                            <div class="input-group">
                                <div class="form-group col-md-12">
                                    <label for="to">Project</label>
                                    <input id="event_id" type="text" style="font-size:12px;" class="form-control" value="{{$details['data']->project_code .' - '.$details['data']->project_name}}" readonly>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="to">Event Name</label>
                                    <input id="event_name" type="text" name="event_name" class="form-control" placeholder="Event Name">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="from">Date start</label>
                                    <input type="text" class="form-control" id="from" name="from" style="font-size:12px !important;">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="to">Date finish</label>
                                    <input type="text" class="form-control" id="to" name="to" style="font-size:12px !important;">
                                </div>
                                <div class="form-group col-md-12" style="margin: 0px 20px 10px 20px;">
                                    <input type="checkbox" class="form-check-input" name="check" value="is_draggable_event" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">set to draggable event</label>
                                </div>
                                <div class="form-group col-md-12">
                                    <ul class="fc-color-picker" id="color-chooser">
                                        <label for="to">Exist Color</label><br/>
                                        @if(isset($timeline_event_colors['data']) && !empty($timeline_event_colors['data']))
                                            @foreach($timeline_event_colors['data'] AS $key => $val)
                                                <li><a data-color="{{$val->name}}" style="width: 20px; height:30px; display:inline-flex;background-color:{{$val->name}}" href="#"></a></li>
                                            @endforeach
                                        @endif
                                    </ul>
                                </div>
                                <div class="form-group">
                                    <label for="to">Custom Color</label>
                                    <div class="input-group mb-3">
                                        <input type="text" name="custom_color" class="form-control my-colorpicker1 colorpicker-element" data-colorpicker-id="1" data-original-title="" title="">
                                        <div class="input-group-append">
                                            <span class="input-group-text" id="add-new-event"><button type="button" class="btn btn-primary btn-xs">Add</button></span>
                                        </div>
                                    </div>
                                </div>
                                <!-- /btn-group -->
                            </div>
                            <!-- /input-group -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="card card-primary">
                    <div class="card-body p-0">
                        <!-- THE CALENDAR -->
                        <div id="calendar"></div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div><!-- /.container-fluid -->
</section>
<!-- /.content -->