[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="-pull-top -pull-bottom -container">
            <input 
                type="hidden" 
                value="[{$item->opt_id|default:''}]" 
                id="EntryOptId"
                />
            <form name="entryOptForm" id="entryOptForm" target="integration_asynchronous">
                <input type="hidden" name="opt_token" 
                    value="[{$item->opt_token|default:$token|default:''}]"/>
                <div class="lang-tabs default" style="z-index: 11;position: relative;margin-left: 10px">
                    <ul class="nav-tabs">
                        [{assign var="f" value="active"}]
                        [{foreach from=$langs item=la key =k}]
                            <li class="[{$f|default:''}]">
                                <a  title="[{$la->lang_name|ucwords}]"
                                    href="#tab_lang_content_opt_[{$la->lang_short}]"  
                                    data-toggle="tab" 
                                    >
                                        [{$la->lang_name|ucwords}]
                                </a>
                            </li>
                            [{assign var="f" value=""}]
                        [{foreachelse}]
                            
                        [{/foreach}]
                    </ul>
                </div>
                <div class="controls tab-content" style="border-top: 1px solid #ddd;float: left;width: 100%;">
                    [{assign var="f" value="active"}]
                    [{foreach from=$langs item=la key =k}]
                        <div id="tab_lang_content_opt_[{$la->lang_short}]" class="tab-pane [{$f|default:''}]">
                            <div class="control-group pull-top">
                                <div>Title :(*)</div>
                                [{$attr= 'opt_name_'|cat:$la->lang_short}]

                                <input type="text" 
                                    class="form-control validate[required,minSize[2],maxSize[255]]" 
                                    value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                    name="opt_name_[{$la->lang_short}]" 
                                    maxlength="255" 
                                    placeholder="[{$la->lang_name|ucwords}]"
                                    >
                            </div>
                            <div class="control-group pull-top">
                                <div>Desc :(*)</div>
                                [{$attr= 'opt_desc_'|cat:$la->lang_short}]

                                <input type="text" 
                                    class="form-control validate[required,minSize[2],maxSize[255]]" 
                                    value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                    name="opt_desc_[{$la->lang_short}]" 
                                    maxlength="255" 
                                    placeholder="[{$la->lang_name|ucwords}]"
                                    >
                            </div>
                        </div>
                         [{assign var="f" value=""}]
                    [{/foreach}]
                </div>
                <div class="clearfix"></div>
                <div class="control-group pull-top">
                    <div>Value :</div>
                    <input type="text" 
                        rows="1"
                        class="form-control validate[maxSize[100]]"
                        name="opt_size" 
                        value="[{$item->opt_size|escape|default:''}]"/>
                </div>
            </form>
        </div>
    </div>
</div>
[{/nocache}]