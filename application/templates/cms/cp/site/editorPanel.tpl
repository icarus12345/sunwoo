[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>Webpage</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#entry-info" aria-controls="entry-info" role="tab" data-toggle="tab">Information</a>
                    </li>
                    <li role="presentation">
                        <a href="#social-info" aria-controls="social-info" role="tab" data-toggle="tab">Social</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="entry-info">
                        <input 
                            type="hidden" 
                            value="[{$item->site_id|default:''}]" 
                            id="EntryId"
                            />
            
                        <input type="hidden" name="site_type" 
                            value="[{$item->site_type|default:$type|default:''}]"/>
                        <div class="control-group pull-top">
                            <div>Name :</div>
                            <input type="text" 
                                class="form-control" value="[{$item->site_name|escape|default:''}]" 
                                name="site_name"
                                >
                        </div>
                        <div class="control-group pull-top">
                            <div>Title :</div>
                            <input type="text" 
                                class="form-control" value="[{$item->site_title|escape|default:''}]" 
                                name="site_title"
                                >
                        </div>
                        <div class="control-group pull-top">
                            <div>Image :</div>
                            <div class="input-append">
                                <input type="text" 
                                        class="form-control" value="[{$item->site_image|escape|default:''}]" 
                                        name="site_image" id="site_image"
                                        >
                                <span class="add-on" onclick="BrowseServer('#site_image')">
                                    <i class="fa-image"></i>
                                </span>
                            </div>
                        </div>
                        <div class="control-group pull-top">
                            <div>Desc :</div>
                            <textarea 
                                rows="3"
                                class="form-control"
                                name="site_desc">[{$item->site_desc|escape|default:''}]</textarea>

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
                                class="form-control"
                                id="site_content"
                                name="site_content">[{$item->site_content|escape|default:''}]</textarea>

                        </div>
                        [{/if}]
                    </div>
                    <div role="tabpanel" class="tab-pane" id="social-info">
                        <div class="control-group pull-top">
                            <div>Social Title :</div>
                            <input type="text" 
                                class="form-control" value="[{$item->site_social_title|escape|default:''}]" 
                                name="site_social_title"
                                >
                        </div>
                        <div class="control-group pull-top">
                            <div>Social Image :</div>
                            <div class="input-append">
                                <input type="text" 
                                        class="form-control" value="[{$item->site_social_image|escape|default:''}]" 
                                        name="site_social_image" id="site_social_image"
                                        >
                                <span class="add-on" onclick="BrowseServer('#site_social_image')">
                                    <i class="fa-image"></i>
                                </span>
                            </div>
                        </div>
                        <div class="control-group pull-top">
                            <div>Social Desc :</div>
                            <textarea 
                                rows="3"
                                class="form-control"
                                name="site_social_desc">[{$item->site_social_desc|escape|default:''}]</textarea>
                        </div>
                    </div>
                </div>
            </form>
            <div class="pull-top">
                <div class="btn btn-default" title="Save" onclick="[{$tplConfig.name}].onSave()">
                    <i class="fa-save"></i>&nbsp;Save
                </div>
                <div class="btn btn-default" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()">
                    <i class="fa-reply-all"></i>&nbsp;Cancel
                </div>
            </div>
        </div>
    </div>
</div>
[{/nocache}]