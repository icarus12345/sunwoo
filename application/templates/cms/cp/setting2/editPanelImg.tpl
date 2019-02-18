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
                    value="image"/>
                <input type="hidden" name="Status" 
                    value="[{$item->Status|default:'true'}]"/>
                <div class="control-group">
                    <div>Title :</div>
                    <input type="text" 
                        class="form-control" 
                        value="[{$item->Name|escape:'html'|default:''}]" 
                        name="Name"
                        >
                </div>
                <div class="control-group pull-top">
                    <div>
                        Image :
                        <div class="pull-right lang-tabs">
                            <ul class="nav-tabs">
                                <li class="active">
                                    <a  title="Tiếng Việt"
                                        href="#tab_image_vi" 
                                        data-toggle="tab" 
                                        >Vi</a>
                                </li>
                                <li>
                                    <a  title="English"
                                        href="#tab_image_en" 
                                        data-toggle="tab" 
                                        >En</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="controls tab-content">
                        <div id="tab_image_vi" class="tab-pane active">
                            <div class="input-append">
                                <input type="text" 
                                        class="form-control" value="[{$item->Image|escape:'html'|default:''}]" 
                                        name="Image" id="Image"
                                        >
                                <span class="add-on"
                                      data-toggle="tooltip" data-placement="left" title="Tooltip on left"
                                      onclick="BrowseServer('#Image')">
                                    <i class="fa-image"></i>
                                </span>
                            </div>
                        </div>
                        <div id="tab_image_en" class="tab-pane">
                            <div class="input-append">
                                <input type="text" 
                                        class="form-control" value="[{$item->Image_en|escape:'html'|default:''}]" 
                                        name="Image_en" id="Image_en"
                                        >
                                <span class="add-on"
                                      data-toggle="tooltip" data-placement="left" title="Tooltip on left"
                                      onclick="BrowseServer('#Image_en')">
                                    <i class="fa-image"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="control-group">
                    <div>Link :</div>
                    <input type="text" 
                        class="form-control" 
                        value="[{$item->Link|default:''|escape:'html'}]" 
                        name="Link"
                        >
                </div>
            </form>
        </div>
    </div>
</div>