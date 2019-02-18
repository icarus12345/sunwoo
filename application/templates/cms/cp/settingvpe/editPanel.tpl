<div class="row-fluid">
    <div class="widget full">
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
                    value="[{$item->DataType|escape|default:'text'}]"/>
                <input type="hidden" name="Status" 
                    value="true"/>
                [{if $item}]
                <div>
                    <b>[{$item->Name|escape|default:''}]</b>
                </div>
                [{else}]
                <div class="control-group">
                    <div>Name :</div>
                    <input type="text" 
                        class="form-control" 
                        value="[{$item->Name|escape|default:''}]" 
                        name="Name"
                        >
                </div>
                [{/if}]
                <div class="control-group pull-top">
                    <div>Title :</div>
                    <textarea 
                        rows="1"
                        class="form-control"
                        name="Title">[{$item->Title|escape|default:''}]</textarea>
                </div>
                <div class="control-group pull-top">
                    <div>Value :</div>
                    [{if $item->DataType=="bool"}]
                    <select name="Value" class="form-control selectpicker" data-size="10" >
                        <option value="true">True</option>
                        <option value="false" [{if $item->Value=='false'}]selected=1[{/if}]>False</option>
                    </select>
                    [{else}]
                    <textarea 
                        rows="1"
                        class="form-control"
                        name="Value">[{$item->Value|escape|default:''}]</textarea>
                    [{/if}]
                </div>
            </form>
        </div>
    </div>
</div>