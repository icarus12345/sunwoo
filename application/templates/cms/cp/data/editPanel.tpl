<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            [{if $item}]
                <h4>[{$tplConfig.editEntryTitle}]</h4>
            [{else}]
                <h4>[{$tplConfig.addEntryTitle}]</h4>
            [{/if}]
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="[{$item->data_id|default:''}]" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input 
                    type="hidden" 
                    value="[{$item->data_type|default:$type}]" 
                    name="data_type"
                    />
                <div class="row">
                    <div class="col-xs-6">
                        <div class="control-group">
                            <div>Title :</div>
                            <input type="text" 
                                rows="1"
                                class="form-control validate[required,maxSize[255]]"
                                name="data_title" 
                                value="[{$item->data_title|escape|default:''}]"/>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="control-group">
                            <div>Sub Title</div>
                            <input type="text" 
                                class="form-control validate[maxSize[255]]" 
                                value="[{$item->data_subtitle|escape:'html'|default:''}]" 
                                name="data_subtitle" 
                                >
                                
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <div class="control-group pull-top">
                            <div>Image :(*)</div>
                            <div class="input-append">
                                <input type="text" 
                                    class="form-control validate[required,maxSize[255]]" 
                                    value="[{$item->data_thumb|escape:'html'|default:''}]" 
                                    name="data_thumb" 
                                    id="data_thumb"
                                    data-putto="#frmErrorAuthorThumb"
                                    >
                                <span class="add-on" 
                                    title="Choose Image"
                                    onclick="BrowseServer('#data_thumb')">
                                    <i class="fa-image"></i>
                                </span>
                            </div>
                            <div id="frmErrorAuthorThumb"></div>
                        </div>
                        
                    </div>
                    <div class="col-xs-6">
                        <div class="control-group pull-top">
                            <div>    
                                Status :
                            </div>
                            <div style="padding-top: 5px">
                                <span class="circleRad">
                                    <input id="data_status1" 
                                        name="data_status" type="radio" 
                                        [{if $o->data_status!='false'|default:''}]checked[{/if}]
                                        value="true">
                                    <label for="data_status1">Enable&nbsp;&nbsp;</label>
                                </span>
                                <span class="circleRad">
                                    <input id="data_status2" name="data_status" type="radio" value="false"
                                        [{if $o->data_status=='false'|default:''}]checked[{/if}]
                                    >
                                    <label for="data_status2">Disable&nbsp;&nbsp;</label>
                                </span>
                            </div>
                        </div>
                    </div>
                </div> 
                
                <div class="control-group pull-top">
                    <div>Desc :</div>
                    <textarea 
                        rows="3"
                        class="form-control validate[required,maxSize[4000]]"
                        name="data_desc">[{$item->data_desc|escape:'html'|default:''}]</textarea>

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
                        id="data_content"
                        name="data_content">[{$item->data_content|escape|default:''}]</textarea>

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
                <i class="fa-save fa"></i>
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