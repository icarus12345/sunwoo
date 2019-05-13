<div class="row-fluid">
    <div class="widget full">
        <div class="modal-body">
            <input 
                type="hidden" 
                value="[{$item->_id|default:''}]" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input type="hidden" name="_type" 
                    value="[{$item->_type|default:$type|default:''}]"/>
                <input type="hidden" name="_data_type" 
                    value="[{$item->_data_type|default:$type|default:'text'}]"/>
                [{if $item}]
                <div>
                    Setting for "<b>[{$item->_name|escape|default:''}]</b>"
                </div>
                [{else}]
                <div class="control-group">
                    <div>Name :</div>
                    <input type="text" 
                        class="form-control" 
                        value="[{$item->_name|escape|default:''}]" 
                        name="_name"
                        >
                </div>
                [{/if}]
                <div class="control-group pull-top">
                    <div>Title :</div>
                    <textarea 
                        rows="1"
                        class="form-control"
                        name="_title">[{$item->_title|escape|default:''}]</textarea>
                </div>
                [{if $item->_data_type == 'image'}]
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
                [{elseif $item->_data_type == 'html'}]
                    [{if $ci->agent->is_mobile()}]
                    <div class="pull-top">
                        <div class="code">Editor is hidden in Mobile, please user desktop browser to edit.</div>
                    </div>
                    [{else}]
                    <div class="control-group pull-top">
                        <div>Value :</div>
                        <textarea 
                            rows="10"
                            class="form-control"
                            id="EditorValue"
                            name="_value">[{$item->_value|escape|default:''}]</textarea>    
                    </div>
                    [{/if}]
                [{else}]
                <div class="control-group pull-top">
                    <div>Value :</div>
                    <textarea 
                        rows="2"
                        class="form-control"
                        name="_value">[{$item->_value|escape|default:''}]</textarea>
                              
                </div>
                [{/if}]
            </form>
        </div>
    </div>
</div>