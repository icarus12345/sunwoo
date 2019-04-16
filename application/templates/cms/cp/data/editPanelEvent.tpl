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
                value="[{$item->data_id|default:''}]" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input 
                    type="hidden" 
                    value="[{$item->data_type|default:$type}]" 
                    name="data_type"
                    />
                <div class="row">
                    <div class="col-xs-12">
                        <div class="control-group">
                            <div>
                                Name :(*)
                                <div class="pull-right lang-tabs">
                                    <ul class="nav-tabs">
                                        <li class="active">
                                            <a  title="Tiếng Việt"
                                                href="#tab_data_name_vi" 
                                                data-toggle="tab" 
                                                >Vi</a>
                                        </li>
                                        <li>
                                            <a  title="English"
                                                href="#tab_data_name_en" 
                                                data-toggle="tab" 
                                                >En</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="controls tab-content">
                                <div id="tab_data_name_vi" class="tab-pane active">
                                    <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,maxSize[255]]"
                                        name="data_name" 
                                        value="[{$item->data_name|escape|default:''}]"/>
                                </div>
                                <div id="tab_data_name_en" class="tab-pane">
                                    <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,maxSize[255]]"
                                        name="data_name_en" 
                                        value="[{$item->data_name_en|escape|default:''}]"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <div class="control-group pull-top">
                            <div>
                                Title :(*)
                                <div class="pull-right lang-tabs">
                                    <ul class="nav-tabs">
                                        <li class="active">
                                            <a  title="Tiếng Việt"
                                                href="#tab_data_title_vi" 
                                                data-toggle="tab" 
                                                >Vi</a>
                                        </li>
                                        <li>
                                            <a  title="English"
                                                href="#tab_data_title_en" 
                                                data-toggle="tab" 
                                                >En</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="controls tab-content">
                                <div id="tab_data_title_vi" class="tab-pane active">
                                    <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,maxSize[255]]"
                                        name="data_title" 
                                        value="[{$item->data_title|escape|default:''}]"/>
                                </div>
                                <div id="tab_data_title_en" class="tab-pane">
                                    <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,maxSize[255]]"
                                        name="data_title_en" 
                                        value="[{$item->data_title_en|escape|default:''}]"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="control-group pull-top">
                            <div>
                                Sub Title :(*)
                                <div class="pull-right lang-tabs">
                                    <ul class="nav-tabs">
                                        <li class="active">
                                            <a  title="Tiếng Việt"
                                                href="#tab_data_subtitle_vi" 
                                                data-toggle="tab" 
                                                >Vi</a>
                                        </li>
                                        <li>
                                            <a  title="English"
                                                href="#tab_data_subtitle_en" 
                                                data-toggle="tab" 
                                                >En</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="controls tab-content">
                                <div id="tab_data_subtitle_vi" class="tab-pane active">
                                    <input type="text" 
                                        class="form-control validate[maxSize[255]]" 
                                        value="[{$item->data_subtitle|escape:'html'|default:''}]" 
                                        name="data_subtitle" 
                                        >
                                </div>
                                <div id="tab_data_subtitle_en" class="tab-pane">
                                    <input type="text" 
                                        class="form-control validate[maxSize[255]]" 
                                        value="[{$item->data_subtitle_en|escape:'html'|default:''}]" 
                                        name="data_subtitle_en" 
                                        >
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <div class="control-group pull-top">
                            <div>Image :</div>
                            <div class="input-append">
                                <input type="text" 
                                    class="form-control validate[maxSize[255]]" 
                                    value="[{$item->data_thumb|escape:'html'|default:''}]" 
                                    name="data_thumb" 
                                    id="data_thumb"
                                    data-putto="#frmErrorAuthorThumb"
                                    >
                                <span class="add-on" 
                                    title="Choose Image"
                                    onclick="BrowseServer('#data_thumb')">
                                    <i class="fa fa-image"></i>
                                </span>
                            </div>
                            <div id="frmErrorAuthorThumb"></div>
                        </div>
                        
                    </div>
                    <div class="col-xs-6">
                        <div class="control-group pull-top">
                            <div>Cover :</div>
                            <div class="input-append">
                                <input type="text" 
                                    class="form-control validate[maxSize[255]]" 
                                    value="[{$item->data_cover|escape:'html'|default:''}]" 
                                    name="data_cover" 
                                    id="data_cover"
                                    data-putto="#frmErrorCover"
                                    >
                                <span class="add-on" 
                                    title="Choose Image"
                                    onclick="BrowseServer('#data_cover')">
                                    <i class="fa fa-image"></i>
                                </span>
                            </div>
                            <div id="frmErrorCover"></div>
                        </div>
                        
                    </div>
                    
                </div> 
                <div class="row">
                                    
                    <!-- <div class="col-mb-4">
                        <div class="control-group pull-top">
                            <div>Start date :</div>
                            <div class='input-group date'>
                                <input type='text' class="form-control"
                                    name="data_startdate" 
                                    value="[{$item->data_startdate|default:''}]"
                                    data-date-format="YYYY-MM-DD H:m:s"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-mb-4">
                        <div class="control-group pull-top">
                            <div>End date :</div>
                            <div class='input-group date'>
                                <input type='text' class="form-control"
                                    name="data_enddate" 
                                    value="[{$item->data_enddate|default:''}]"
                                    data-date-format="YYYY-MM-DD H:m:s"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                        </div>
                    </div> -->
                    <div class="col-xs-4">
                        <div class="control-group pull-top">
                            <div>    
                                Status :
                            </div>
                            <div style="padding-top: 5px">
                                <span class="circleRad">
                                    <input id="data_status1" 
                                        name="data_status" type="radio" 
                                        [{if $o->data_status!='false'|default:''}]checked[{/if}]
                                        value="true">
                                    <label for="data_status1">Enable&nbsp;&nbsp;</label>
                                </span>
                                <span class="circleRad">
                                    <input id="data_status2" name="data_status" type="radio" value="false"
                                        [{if $o->data_status=='false'|default:''}]checked[{/if}]
                                    >
                                    <label for="data_status2">Disable&nbsp;&nbsp;</label>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="control-group pull-top">
                    <div class="control-group pull-top">
                        <div>
                            Desc :(*)
                            <div class="pull-right lang-tabs">
                                <ul class="nav-tabs">
                                    <li class="active">
                                        <a  title="Tiếng Việt"
                                            href="#tab_data_desc_vi" 
                                            data-toggle="tab" 
                                            >Vi</a>
                                    </li>
                                    <li>
                                        <a  title="English"
                                            href="#tab_data_desc_en" 
                                            data-toggle="tab" 
                                            >En</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="controls tab-content">
                            <div id="tab_data_desc_vi" class="tab-pane active">
                                <textarea 
                                    rows="3"
                                    class="form-control validate[required,maxSize[255]]"
                                    name="data_desc">[{$item->data_desc|escape:'html'|default:''}]</textarea>
                            </div>
                            <div id="tab_data_desc_en" class="tab-pane">
                                <textarea 
                                    rows="3"
                                    class="form-control validate[required,maxSize[255]]"
                                    name="data_desc_en">[{$item->data_desc_en|escape:'html'|default:''}]</textarea>
                            </div>
                        </div>
                    </div>

                </div>
                [{if $ci->agent->is_mobile()}]
                <div class="pull-top">
                    <div class="code">Editor is hidden in Mobile, please user desktop browser to edit.</div>
                </div>
                [{else}]
                <div class="control-group pull-top">
                    <div>
                        Content :(*)
                        <div class="pull-right lang-tabs">
                            <ul class="nav-tabs">
                                <li class="active">
                                    <a  title="Tiếng Việt"
                                        href="#tab_data_content_vi" 
                                        data-toggle="tab" 
                                        >Vi</a>
                                </li>
                                <li>
                                    <a  title="English"
                                        href="#tab_data_content_en" 
                                        data-toggle="tab" 
                                        >En</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="controls tab-content">
                        <div id="tab_data_content_vi" class="tab-pane active">
                            <textarea 
                                rows="10"
                                class="form-control"
                                id="data_content"
                                name="data_content">[{$item->data_content|escape|default:''}]</textarea>
                        </div>
                        <div id="tab_data_content_en" class="tab-pane">
                            <textarea 
                                rows="10"
                                class="form-control"
                                id="data_content_en"
                                name="data_content_en">[{$item->data_content_en|escape|default:''}]</textarea>
                        </div>
                    </div>

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