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
                value="[{$item->topic_id|default:''}]" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input 
                    type="hidden" 
                    value="[{$item->topic_type|default:$type}]" 
                    name="topic_type"
                    id="topic_type"
                    />
                <div class="row">
                    <div class="col-mb-6">
                        <div class="control-group pull-top">
                            <div>Title :</div>
                            <input type="text" 
                                rows="1"
                                onblur="AliasTo('#entryForm input[name=topic_title]','#entryForm input[name=topic_alias]')" 
                                class="form-control validate[required,maxSize[255]]"
                                name="topic_title" 
                                value="[{$item->topic_title|escape|default:''}]"/>
                        </div>
                    </div>
                    <div class="col-mb-6">
                        <div class="control-group pull-top">
                            <div>Alias :</div>
                            <input type="text" 
                                rows="1"
                                class="form-control validate[required,maxSize[255]]"
                                name="topic_alias" 
                                value="[{$item->topic_alias|escape|default:''}]"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-mb-6">
                        <div class="control-group pull-top">
                            <div>Author :</div>
                            <select 
                                name="topic_author" 
                                class="form-control selectpicker"
                                data-putto="#frm-err-topic-author"
                                data-live-search="true"
                                data-size="10"
                                >
                                <option value="">Nothing Selected</option>
                                [{if $aAuthors|default:null}]
                                [{foreach from=$aAuthors item=o}]
                                    <option
                                        [{if $o->author_id == $item->topic_author}]selected="1"[{/if}]
                                        value="[{$o->author_id|default:''}]">
                                            [{$o->author_name|default:''}]
                                    </option>
                                [{/foreach}]
                                [{/if}]
                            </select>
                        </div>
                        <div id="frm-err-topic-author"></div>
                    </div>
                    <div class="col-mb-6">
                        <div class="control-group pull-top">
                            <div>Status :</div>
                            <div style="padding-top:5px">
                                <span class="circleRad">
                                    <input id="topic_status1" 
                                        name="topic_status" type="radio" 
                                        [{if $o->topic_status!='false'|default:''}]checked[{/if}]
                                        value="true">
                                    <label for="topic_status1">Enable&nbsp;&nbsp;</label>
                                </span>
                                <span class="circleRad">
                                    <input id="topic_status2" name="topic_status" type="radio" value="false"
                                        [{if $o->topic_status=='false'|default:''}]checked[{/if}]
                                    >
                                    <label for="topic_status2">Disable&nbsp;&nbsp;</label>
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
                        name="topic_desc">[{$item->topic_desc|escape:'html'|default:''}]</textarea>

                </div>
                <div class="control-group pull-top">
                    <div>Tag :</div>
                    <textarea 
                        rows="3"
                        class="form-control validate[required,maxSize[255]]"
                        name="topic_tag">[{$item->topic_tag|escape:'html'|default:''}]</textarea>

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
                        class="form-control validate[required]"
                        id="topic_content"
                        name="topic_content">[{$item->topic_content|escape|default:''}]</textarea>

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