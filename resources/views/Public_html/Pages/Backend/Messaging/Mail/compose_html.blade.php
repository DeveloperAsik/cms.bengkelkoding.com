<!-- summernote -->
<link rel="stylesheet" href="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/summernote/summernote-bs4.css">
<!-- Select2 -->
<link rel="stylesheet" href="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/select2/css/select2.min.css">
<link rel="stylesheet" href="{{config('app.base_assets_uri')}}/templates/adminlte/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
<style>
    .ui-autocomplete{
        background-color:#ccc;
        width:50%;
        padding:10px 15px 10px 15px;
        list-style: none;
    }
    .select2-container--default .select2-selection--multiple .select2-selection__choice{
        color:#666
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
                        <h3 class="card-title">Compose New Message</h3>
                    </div>
                    <form id="submit_compose">
                        <!-- /.card-header -->
                        <div class="card-body">
                            <!--<div class="form-group">
                                <input class="form-control" placeholder="To:" name="to" />
                            </div> -->
                            <div class="form-group">
                                <label for="" class="col-sm-2 control-label">Send Message to</label>
                                <div class="col-sm-10">
                                    <select class="select2" multiple="multiple" name="to[]" data-placeholder="Send email to:" style="width: 100%;"></select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-sm-2 control-label">Message Subject</label>
                                <div class="col-sm-10">
                                    <input class="form-control" placeholder="Email subject:" name="subject" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-sm-2 control-label">Content</label>
                                <div class="col-sm-10">
                                    <textarea id="compose-textarea" name="text" class="form-control" style="height: 300px"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="btn btn-default btn-file" id="add_attach" style="margin:0px 0px 0px 5px;">
                                    <i class="fas fa-paperclip"></i> Add Attachment
                                </div>
                                <p class="help-block" style="margin:0px 0px 0px 5px;">Max. 32MB</p>
                            </div>
                            <div class="form-group" id="result_attachment"></div>
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer">
                            <div class="float-right">
                                <button type="submit" name="submit" class="btn btn-default" value="save_draft"><i class="fas fa-pencil-alt"></i> Draft</button>
                                <button type="submit" name="submit"  class="btn btn-primary" value="insert"><i class="far fa-envelope"></i> Send</button>
                            </div>
                            <button type="submit" name="submit"  class="btn btn-default" value="discard_msg"><i class="fas fa-times"></i> Discard</button>
                        </div>
                    </form>
                    <!-- /.card-footer -->
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div><!-- /.container-fluid -->
</section>
<!-- /.content -->