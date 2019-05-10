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
                    value="[{$item->_data_type|escape|default:'text'}]"/>
                <input type="hidden" name="_status" 
                    value="1"/>
                [{if $item}]
                <div>
                    <b>[{$item->_name|escape|default:''}]</b>
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
                <div class="control-group pull-top">
                    <div>Value :</div>
                    [{if $item->_data_type=="bool"}]
                    <select name="_value" class="form-control selectpicker" data-size="10" >
                        <option value="true">True</option>
                        <option value="false" [{if $item->_value=='false'}]selected=1[{/if}]>False</option>
                    </select>
                    [{else}]
                    <textarea 
                        rows="1"
                        class="form-control"
                        name="_value">[{$item->_value|escape|default:''}]</textarea>
                    [{/if}]
                </div>
            </form>
        </div>
    </div>
</div>