[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>Setting</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="[{$item->_id|default:''}]" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input type="hidden" name="_type" 
                    value="[{$item->_type|default:$type|default:''}]"/>
                <input type="hidden" name="_status" 
                    value="[{$item->_status|default:'1'}]"/>
                <div class="row">
                    <div class="col-xs-6 col-mb-6">
                        <div class="control-group pull-top">
                            <div>Name :</div>
                            <input type="text" 
                                class="form-control" 
                                value="[{$item->_name|escape|default:''}]" 
                                name="_name"
                                >
                        </div>
                    </div>
                    <div class="col-xs-6 col-mb-6">
                        <div class="control-group pull-top">
                            <div>Data type :</div>
                            <select class="form-control selectpicker" name="_data_type">
                                <option value="">Default</option>
                                <option [{if $item->_data_type=="text"}]selected="1"[{/if}] value="text">Text</option>
                                <option [{if $item->_data_type=="html"}]selected="1"[{/if}] value="html">Html</option>
                                <option [{if $item->_data_type=="image"}]selected="1"[{/if}] value="image">Image</option>
                                <option [{if $item->_data_type=="video"}]selected="1"[{/if}] value="video">Video</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-mb-12">
                        <div class="control-group pull-top">
                            <div>Title :</div>
                            <input type="text" 
                                class="form-control" value="[{$item->_title|escape|default:''}]" 
                                name="_title"
                                >
                        </div>
                    </div>
                </div>
                
                <div class="control-group pull-top">
                    <div>Desc :</div>
                    <textarea 
                        rows="3"
                        class="form-control"
                        name="_desc">[{$item->_desc|escape|default:''}]</textarea>
                              
                </div>
                <div class="control-group pull-top">
                    <div>Value :</div>
                    <textarea 
                        rows="5"
                        class="form-control"
                        name="_value">[{$item->_value|escape|default:''}]</textarea>
                              
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