<li class="nav-item dropdown">
    <a class="nav-link" data-toggle="dropdown" href="#">
        <i class="far fa-comments"></i>
        <span class="badge badge-danger navbar-badge" id="total_chat">{{isset($total_chat) ? $total_chat : 0}}</span>
    </a>
    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
        @if(isset($msg_chat) && !empty($msg_chat))
            @foreach($msg_chat AS $key => $value)
            <a href="{{ config('app.base_extraweb_uri').'/messaging/chat/'. $value['id'] }}" class="dropdown-item">
                <!-- Message Start -->
                <div class="media">
                    <img src="{{$value['photo']}}" alt="User Avatar" class="img-size-50 mr-3 img-circle">
                    <div class="media-body">
                        <h3 class="dropdown-item-title">
                            {{$value['username']}}
                            <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                        </h3>
                        <p class="text-sm">{!! $value['message'] !!}</p>
                        <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> {{$value['time']}}</p>
                    </div>
                </div>
                <!-- Message End -->
            </a>
            @endforeach
        @endif
        <div class="dropdown-divider"></div>
        <a href="{{config('app.base_extraweb_uri') . '/notification/message/all'}}" class="dropdown-item dropdown-footer">See All Chats</a>
    </div>
</li>