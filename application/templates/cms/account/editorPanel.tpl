[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>User Account</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="account.onSave()"><i class="fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="account.onCancel()"><i class="fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="[{$item->ause_id|default:''}]" 
                id="ause_id"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="pull-bottom control-group">
                            <div>Authority :</div>
                            <select class="form-control selectpicker" name="ause_authority" multiple >
                                <option [{if $item->ause_authority=="Guest"}]selected="1"[{/if}] value="Guest">Guest</option>
                                <option [{if $item->ause_authority=="Admin"}]selected="1"[{/if}] value="Admin">Admin</option>
                                <option [{if $item->ause_authority=="User"}]selected="1"[{/if}] value="User">User</option>
                                <option [{if $item->ause_authority=="View"}]selected="1"[{/if}] value="View">View</option>
                                <option [{if $item->ause_authority|strpos:"CP"!==false}]selected="1"[{/if}] value="CP">Content Provider</option>
                                <option [{if $item->ause_authority|strpos:"Video"!==false}]selected="1"[{/if}] value="Video">Video Manager</option>
                                <option [{if $item->ause_authority|strpos:"Audio"!==false}]selected="1"[{/if}] value="Audio">Audio Manager</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class=" pull-bottom control-group">
                            <div>Status :</div>
                            <select class="form-control selectpicker" name="ause_status">
                                <option [{if $item->ause_status=="true"}]selected="1"[{/if}] value="true">Enable</option>
                                <option [{if $item->ause_status=="false"}]selected="1"[{/if}] value="false">Disable</option>
                            </select>
                        </div>
                    </div>   
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="pull-bottom control-group">
                            <div>Account Name :</div>
                            <input type="text" class="form-control validate[required]" 
                                   name="ause_name"
                                   value="[{$item->ause_name|quotes_to_entities|default:''}]"
                                   data-putto=".error-ause_name"/>
                            <div class="erb error-ause_name"></div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="pull-bottom control-group">
                            <div>Email :</div>
                            <input type="text" class="form-control validate[required]" 
                                   name="ause_email"
                                   value="[{$item->ause_email|quotes_to_entities|default:''}]"
                                   data-putto=".error-ause_email"/>
                            <div class="erb error-ause_email"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="pull-bottom control-group">
                            <div>Username :</div>
                            <input type="text" class="form-control validate[required]" 
                                   name="ause_username"
                                   value="[{$item->ause_username|quotes_to_entities|default:''}]"
                                   data-putto=".error-ause_username"/>
                            <div class="erb error-ause_username"></div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class=" pull-bottom control-group">
                            <div>Password :</div>
                            <div class="input-append">
                                <input type="text" class="form-control" 
                                    placeholder="Current password"
                                    name="ause_password"
                                    value=""
                                    />
                                <span class="add-on" title="Random new password" onclick="account.getNewPass()">
                                    <i class="fa-random"></i>
                                </span>
                            </div>
                        </div>
                    </div>   
                </div>

                <div>
                    <button class="btn btn-default" onclick="account.onSave()">Save</button>
                    <button class="btn btn-default" onclick="account.onCancel()">Cancel</button>
                </div>
                <div class="bs-callout bs-callout-danger">
                    <h4>Note</h4>
                    <div>
                        User : can't create new cms account.<br/>
                        Admin : can create new cms account and update cms user account<br/>
                        View : only view data, can't create, update entry data.
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
[{/nocache}]