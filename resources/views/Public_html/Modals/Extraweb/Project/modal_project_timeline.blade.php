<div class="modal fade" id="modalProjectTimeline" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalProjectTimelineLabel"></h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="project_name" class="col-sm-12 control-label">Timeline Name</label>
                            <div class="col-sm-12">
                                <input type="text" name="project_name" readonly/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="date_start" class="col-sm-12 control-label">Start Date</label>
                            <div class="col-sm-12">
                                <input type="text" name="date_start"  readonly/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="date_end" class="col-sm-12 control-label">End Date</label>
                            <div class="col-sm-12">
                                <input type="text" name="date_end" readonly />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <label for="notes" class="col-sm-12 control-label">New Notes</label>
                            <div class="col-sm-12">
                                <textarea id="notes" name="notes" cols="40" rows="5"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="text" name="id" hidden/>
                                <input type="text" name="project_timeline_id" hidden/>
                                <input type="text" name="project_timeline_event_id" hidden/>
                                <button type="button" class="btn btn-primary" name="save" id="save">Save</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4" style="height:300px;overflow: scroll">
                        <div class="form-group">
                            <label for="last_notes"class="col-sm-12 control-label">Last Notes</label>
                            <div id="notesLbl" ></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
