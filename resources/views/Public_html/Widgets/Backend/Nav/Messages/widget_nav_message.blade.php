<li class="nav-item dropdown">
    <a class="nav-link" data-toggle="dropdown" href="#">
        <i class="far fa-bell"></i>
        <span class="badge badge-primary navbar-badge" id="total_inbox">{{isset($total_inbox) ? $total_inbox : 0}}</span>
    </a>
    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
        <span class="dropdown-item dropdown-header">{{isset($total_inbox) ? $total_inbox : 0}} Inbox message</span>
        <div class="dropdown-divider"></div>
        @if(isset($msg_inbox) && !empty($msg_inbox))
            @foreach($msg_inbox AS $key => $value)
                <a href="{{ config('app.base_extraweb_uri').'/messaging/inbox/'. $value['id'] }}" class="dropdown-item">
                    <div class="media">
                        <div class="media-body">
                            <h3 class="dropdown-item-title">
                                {{$value['username']}}
                                <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                            </h3>
                            <p class="text-sm">{!! $value['message'] !!}</p>
                            <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> {{$value['time']}}</p>
                        </div>
                    </div>
                </a>
            @endforeach
        @endif
        <div class="dropdown-divider"></div>
        <a href="{{config('app.base_extraweb_uri') .'/messaging/inbox'}}" class="dropdown-item dropdown-footer">See All Messages</a>
    </div>
</li>