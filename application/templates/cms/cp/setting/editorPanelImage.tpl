[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <!-- <div class="modal-header">
            <h4>&nbsp;Setting</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa fa-reply-all"></i></a></li>
            </ul>
        </div> -->
        <div class="-pull-top -pull-bottom -container">
            <input 
                type="hidden" 
                value="[{$item->_id|default:''}]" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input 
                    type="hidden" 
                    value="[{$item->_data_type|default:''}]" 
                    name="_data_type"
                    />
                <input type="hidden" name="_type" 
                    value="[{$item->_type|default:$type|default:''}]"/>
                [{if $item->_readonly|default:'0'=="0"}]
                <div class="control-group pull-top">
                    <div>Name :</div>
                    <input type="text" 
                        class="form-control" value="[{$item->_name|escape|default:''}]" 
                        name="_name"
                        >
                </div>
                [{else}]
                    <div><b>[{$item->_name|escape|default:''}]</b></div>
                [{/if}]
                <div class="control-group pull-top">
                    <div>Title :</div>
                    <textarea 
                        rows="1"
                        class="form-control"
                        name="_title">[{$item->_title|escape|default:''}]</textarea>
                </div>
                <div class="control-group pull-top">
                    <div>Image :</div>
                    <div class="input-append">
                        <input type="text" 
                                class="form-control" value="[{$item->_value|escape|default:''}]" 
                                name="_value" id="_value"
                                >
                        <span class="add-on"
                              data-toggle="tooltip" data-placement="left" title="Tooltip on left"
                              onclick="BrowseServer('#_value')">
                            <i class="fa fa-image"></i>
                        </span>
                    </div>
                </div>
                <!-- <div class="control-group pull-top">
                    <div>Link :</div>
                    <input type="text" 
                        class="form-control" value="[{$item->Link|escape|default:''}]" 
                        name="Link"
                        >
                </div> -->
                <div class="control-group pull-top">
                    <div>Desc :</div>
                    <textarea 
                        rows="3"
                        class="form-control"
                        name="_desc">[{$item->_desc|escape|default:''}]</textarea>
                              
                </div>
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
[{/nocache}]