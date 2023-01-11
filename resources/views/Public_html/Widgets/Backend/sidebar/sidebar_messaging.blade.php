<a href="{{config('app.base_extraweb_uri')}}/messaging/compose" class="btn btn-primary btn-block mb-3">Compose</a>
<div class="card">
    <div class="card-header">
        <h3 class="card-title">Messaging</h3>
        <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
            </button>
        </div>
    </div>
    <div class="card-body p-0">
        <ul class="nav nav-pills flex-column">
            <li class="nav-item active">
                <a href="{{config('app.base_extraweb_uri').'/messaging/inbox'}}" class="nav-link">
                    <i class="fas fa-inbox"></i> Inbox
                    <span class="badge bg-primary float-right">{{isset($total_inbox) ? $total_inbox : 0}}</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="{{config('app.base_extraweb_uri').'/messaging/sent'}}" class="nav-link">
                    <i class="far fa-envelope"></i> Sent
                    <span class="badge bg-success float-right">{{isset($total_sent) ? $total_sent : 0}}</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="{{config('app.base_extraweb_uri').'/messaging/draft'}}" class="nav-link">
                    <i class="far fa-file-alt"></i> Drafts 
                    <span class="badge bg-secondary float-right">{{isset($total_draft) ? $total_draft : 0}}</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="{{config('app.base_extraweb_uri').'/messaging/junk'}}" class="nav-link">
                    <i class="fas fa-filter"></i> Junk
                    <span class="badge bg-warning float-right">{{isset($total_junk) ? $total_junk : 0}}</span>
                </a>
            </li>
        </ul>
    </div>
    <!-- /.card-body -->
</div>
<!-- /.card -->