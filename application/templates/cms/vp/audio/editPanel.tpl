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
                value="[{$item->audio_id|default:''}]" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <div class="row">
                    <div class="col-mb-6">
                        <div class="control-group pull-bottom">
                            <div>Title :</div>
                            <input type="text" 
                                rows="1"
                                class="form-control validate[required]"
                                name="audio_title" 
                                value="[{$item->audio_title|escape|default:''}]"/>
                        </div>
                    </div>
                    <div class="col-mb-6">
                        <div class="pull-bottom control-group">
                            <div>Topic :(*)</div>

                            <div class="row-fluid">
                                <select 
                                    name="audio_topic" 
                                    class="form-control selectpicker"
                                    data-putto="#frm-err-video-topic"
                                    data-live-search="true"
                                    data-size="10"
                                    >
                                    <option value="">Nothing Selected</option>
                                    [{if $topics|default:null}]
                                    [{foreach from=$topics item=a}]
                                        <optgroup label="Author: [{$a[0]->author_name|default:''|escape:'html'}]">
                                        [{foreach from=$a item=o}]

                                        <option
                                            [{if $o->topic_id == $item->audio_topic}]selected="1"[{/if}]
                                            value="[{$o->topic_id|default:''}]">
                                                [{$o->topic_title|default:''|escape:'html'}]
                                        </option>
                                        [{/foreach}]
                                        </optgroup>
                                    [{/foreach}]
                                    [{/if}]
                                </select>
                            </div>
                            <div id="frm-err-video-topic"></div> 
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-mb-6">
                        <div class="control-group">
                            <div>
                                Type :
                                <span class="circleRad">
                                    <input id="audio_type1" 
                                        name="audio_type" type="radio" 
                                        [{if  $item->audio_type|default:'soundcloud'=='soundcloud'}]checked=""[{/if}] value="soundcloud">
                                    <label for="audio_type1">soundcloud&nbsp;&nbsp;</label>
                                </span>
                                <span class="circleRad">
                                    <input id="audio_type2" name="audio_type" type="radio" value="Local" 
                                        [{if  $item->audio_type=='Local'}]checked=""[{/if}]
                                        onclick="audioApp.chooseFile()">
                                    <label for="audio_type2">Local&nbsp;&nbsp;</label>
                                </span>

                            </div>
                        </div>
                    </div>
                    <div class="col-mb-6">
                                Status :
                                <span class="circleRad">
                                    <input id="audio_status1" 
                                        name="audio_status" type="radio" 
                                        [{if  $item->audio_status|default:'true'=='true'}]checked=""[{/if}]
                                        value="true">
                                    <label for="audio_status1">Enable&nbsp;&nbsp;</label>
                                </span>
                                <span class="circleRad">
                                    <input id="audio_status2" name="audio_status" type="radio" 
                                        [{if  $item->audio_status=='false'}]checked=""[{/if}]
                                        value="false" >
                                    <label for="audio_status2">Disable&nbsp;&nbsp;</label>
                                </span>
                    </div>
                </div>

                <div class="control-group">
                    <div>
                        <div class="lang-tabs pull-left">
                            <ul class="nav-tabs">
                                <li class="active">
                                    <a  title="Code"
                                        href="#tab-code-input"  
                                        data-toggle="tab" 
                                        >
                                            Code
                                    </a>
                                </li>
                                <li class="">
                                    <a  title="Code"
                                        href="#tab-code-preview" 
                                        onclick="$('#audio-preview').html(document.entryForm.audio_code.value)" 
                                        data-toggle="tab" 
                                        >
                                            Preview
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="controls tab-content">
                        <div id="tab-code-input" class="tab-pane active">
                            <textarea class="form-control validate[required]" 
                                rows="3"
                                name="audio_code"
                                data-putto=".audio_code" >[{$item->audio_code|quotes_to_entities|default:''}]</textarea>
                        </div>
                        <div id="tab-code-preview" class="tab-pane">
                            <div id="audio-preview" style="border:1px solid #ddd;padding:0px">
                                ...
                            </div>
                        </div>
                    </div>
                    <div class="erb audio_code"></div>
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