[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>Setting</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="[{$item->Id|default:''}]" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input type="hidden" name="Type" 
                    value="[{$item->Type|default:$type|default:''}]"/>
                <input type="hidden" name="DataType" 
                    value="text"/>
                <div>
                    <b>[{$item->Name|escape|default:''}]</b>
                </div>
                <div class="control-group pull-top">
                    <div>Title :</div>
                    <textarea 
                        rows="1"
                        class="form-control"
                        name="Title">[{$item->Title|escape|default:''}]</textarea>
                </div>
                <div class="control-group pull-top">
                    <div>Image :</div>
                    <div class="input-append">
                        <input type="text" 
                                class="form-control" value="[{$item->Image|escape|default:''}]" 
                                name="Image" id="Image"
                                >
                        <span class="add-on" onclick="BrowseServer('#Image')">
                            <i class="fa-image"></i>
                        </span>
                    </div>
                </div>
                <div class="control-group pull-top">
                    <div>Desc :</div>
                    <textarea 
                        rows="3"
                        class="form-control"
                        name="Desc">[{$item->Desc|escape|default:''}]</textarea>
                              
                </div>
                <div class="control-group pull-top">
                    <div>Value :</div>
                    <textarea 
                        rows="5"
                        class="form-control"
                        id="EditorValue"
                        name="Value">[{$item->Value|escape|default:''}]</textarea>
                              
                </div>
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
[{/nocache}]