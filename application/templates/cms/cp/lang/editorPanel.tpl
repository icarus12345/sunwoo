[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>Content</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input 
                    type="hidden" 
                    value="[{$lang_set|default:''}]" 
                    id="lang_set" name="lang_set"
                    />
                [{if !isset($item)}]
                <div class="pull-bottom">
                    <div>Name</div>
                    <div class="input-group ">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-comment"></i>
                        </span>
                        <input type="text" class="form-control validate[required]" 
                               placeholder="Name" 
                               name="lang_key" id="lang_key"
                               data-putto=".error_title"/>
                    </div>
                    <div class="erb error_title"></div>
                </div>
                [{else}]
                <input 
                    type="hidden" 
                    value="[{$item.data[$langs[0]->lang_short]->lang_key|quotes_to_entities}]" 
                    id="lang_key" name="lang_key"
                    />
                [{/if}]
                <div class="pull-bottom">
                    <div>
                        Custom language for "[{$item.data[$langs[0]->lang_short]->lang_key|quotes_to_entities|default:'New value'}]"  :
                        <div class="pull-right lang-tabs">
                            <ul class="nav-tabs">
                                [{assign var="f" value="active"}]
                                [{foreach from=$langs item=la key =k}]
                                    <li class="[{$f|default:''}]">
                                        <a  title="[{$la->lang_name|ucwords}]"
                                            href="#tab_de_desc_[{$la->lang_short}]"  
                                            data-toggle="tab" 
                                            >
                                                [{$la->lang_short|ucwords}]
                                        </a>
                                    </li>
                                    [{assign var="f" value=""}]
                                [{foreachelse}]
                                    
                                [{/foreach}]
                            </ul>
                        </div>
                    </div>
                    <div class="input-group">
                        <div class="controls tab-content">
                            [{assign var="f" value="active"}]
                            [{foreach from=$langs item=la key =k}]
                            <div id="tab_de_desc_[{$la->lang_short}]" 
                                class="tab-pane [{$f|default:''}]">
                                <textarea class="form-control validate[required]" 
                                          rows="10" name="lang_text" 
                                          data-putto=".error_message" 
                                          data-lang="[{$la->lang_short}]"
                                          placeholder="[{$la->lang_name|ucwords}]">[{$item.data[$la->lang_short]->lang_text|quotes_to_entities|default:''}]</textarea>
                            </div>
                                [{assign var="f" value=""}]
                            [{foreachelse}]
                                    
                            [{/foreach}]
                        </div>
                    </div>
                    <div class="erb error_message"></div>
                </div>
<!--                <div class="">
                    <button style="width: 100%" class="btn btn-default" type="button" onclick="sendquestion();">Gửi</button>
                </div>-->
                <div id="sendquestion-message"></div>
            </form>
        </div>
<!--        <div class="modal-footer">
            <button class="btn btn-primary" onclick="toggleContent()">Done</button>
            <button class="btn btn-default" onclick="language.onCancel()">Cancel</button>
            <div class="base_loading modal-loading" style="display: none;"></div>
        </div>-->
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