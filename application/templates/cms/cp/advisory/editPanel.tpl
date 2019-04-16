<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            [{if $item}]
                <h4>[{$tplConfig.editEntryTitle}]</h4>
            [{else}]
                <h4>[{$tplConfig.addEntryTitle}]</h4>
            [{/if}]
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="[{$item->advisory_id|default:''}]" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <div class="control-group">
                    <div>Title :</div>
                    <input type="text" 
                        rows="1"
                        class="form-control validate[required,maxSize[255]]"
                        name="advisory_title" 
                        value="[{$item->advisory_title|escape|default:''}]"/>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <div class="pull-top control-group">
                            <div>Category :</div>
                            <div class='input-group'>
                                <select name="advisory_category" class="form-control selectpicker"
                                    data-live-search="true"
                                    data-size="10"
                                    >
                                    <option value="" >Nothing Select</option>
                                    [{foreach from=$cates item=c}]
                                        <option 
                                            data-content="<span style='padding-left: [{($c->cat_value|substr_count:'>' -1) *20}]px;'>[{$c->cat_title|escape:'html'}]</span>"
                                            [{if $c->cat_id == $item->advisory_category}]selected="1"[{/if}]
                                            value="[{$c->cat_id|default:''}]">
                                                [{$c->cat_title|default:''}]
                                        </option>
                                    [{/foreach}]
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="control-group pull-top">
                            <div>Name</div>
                            <input type="text" 
                                class="form-control validate[required,maxSize[255]]" 
                                value="[{$item->advisory_name|escape:'html'|default:''}]" 
                                name="advisory_name" 
                                >
                                
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-mb-4">
                        <div class="control-group pull-top">
                            <div>Answers :</div>
                            <input type='text' class="form-control"
                                name="advisory_by" 
                                value="[{$item->advisory_by|default:''}]"/>
                        </div>
                    </div>
                    <div class="col-mb-4">
                        <div class="control-group pull-top">
                            <div>Public date :</div>
                            <div class='input-group date'>
                                <input type='text' class="form-control"
                                    name="advisory_publicday" 
                                    value="[{$item->advisory_publicday|default:('Y-m-d H:i:s'|date)}]"
                                    data-date-format="YYYY-MM-DD H:m:s"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <div class="control-group pull-top">
                            <div>    
                                Status :
                            </div>
                            <div style="padding-top: 5px">
                                <span class="circleRad">
                                    <input id="advisory_status1" 
                                        name="advisory_status" type="radio" 
                                        [{if $item->advisory_status!='false'|default:''}]checked[{/if}]
                                        value="true">
                                    <label for="advisory_status1">Enable&nbsp;&nbsp;</label>
                                </span>
                                <span class="circleRad">
                                    <input id="advisory_status2" name="advisory_status" type="radio" value="false"
                                        [{if $item->advisory_status=='false'|default:''}]checked[{/if}]
                                    >
                                    <label for="advisory_status2">Disable&nbsp;&nbsp;</label>
                                </span>
                            </div>
                        </div>
                    </div>
                </div> 
                
                <div class="control-group pull-top">
                    <div>Question :</div>
                    <textarea 
                        rows="3"
                        class="form-control validate[required,maxSize[4000]]"
                        name="advisory_desc">[{$item->advisory_desc|escape:'html'|default:''}]</textarea>

                </div>
                [{if $ci->agent->is_mobile()}]
                <div class="pull-top">
                    <div class="code">Editor is hidden in Mobile, please user desktop browser to edit.</div>
                </div>
                [{else}]
                <div class="control-group pull-top">
                    <div>Content :</div>
                    <textarea 
                        rows="10"
                        class="form-control"
                        id="advisory_content"
                        name="advisory_content">[{$item->advisory_content|escape|default:''}]</textarea>

                </div>
                [{/if}]
            </form>
        </div>
    </div>
</div>
<ul class="round-buttons round-fixed f-second">
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()">
                <i class="fa fa-save fa"></i>
            </a>
        </div>
    </li>
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()">
                <i class="fa fa-reply-all"></i>
            </a>
        </div>
    </li>
</ul>