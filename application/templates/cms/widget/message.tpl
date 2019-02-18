<div class="message-dropdown transition" role="menu" aria-labelledby="dLabel">
    <div class="fill-search-control">
        <div class="pull-top">
            <div class="col-xs-6">
                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="glyphicon glyphicon-th-list"></i>
                    </span>
                    <select class="selectpicker form-control" id="e_type">
                        <option value="e">Message</option>
                        <option value="">Error</option>
                    </select>
                </div>
            </div>
            <div class="col-xs-6">
                <div class='input-group date' id='datetimepicker'>
                    <input type='text' class="form-control"
                            value="[{'Y/m/d'|date}]"
                            data-date-format="YYYY/MM/DD"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="iMessage">
        <div class="log-errors"></div>
    </div>
</div>
<div class="mark-body"></div>