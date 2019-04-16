[{if #scripts#|default:null}]
    [{foreach from=','|explode:#scripts# item=script}]
        <script type="text/javascript" src="[{$script|base_url}]"></script>
    [{/foreach}]
[{/if}]
<script type="text/javascript">
    var onCommit = function(Url,Params, Id,callback) {
        httpRequest({
            'url': Url,
            'data': {
                'Id': Id,
                'Params': Params
            },
            'callback': function(rsdata) {
                if (rsdata.result < 0) {
                    addNotice(rsdata.message,'danger');
                } else {
                    addNotice(rsdata.message,'info');
                    if (typeof callback == 'function') {
                        callback(rsdata);
                    }
                }
            }
        }).call();
    };
    var onSave = function(){
        // document.entryForm.about.value = CKEDITOR.instances['about'].getData();
        if( $('#entryForm').validationEngine('validate') === false)return false;
        var Id = $('#EntryId').val();
        var Params =$('#entryForm').serializeObject();

        this.onCommit(base_url+'cms/co/setting/oncommit/',Params,Id,function(rsdata){
            if(rsdata.result<0){
                addNotice(rsdata.message,'danger');
            }
        });
    };
    $(document).ready(function(){
        // addEditorFeature('about',240);
        $('#entryForm .selectpicker').selectpicker();
        $('#entryForm').validationEngine({'scroll': false});
    });
</script>
[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>Setting</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="onSave()"><i class="fa fa-save"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
        <input type="hidden" id="EntryId" value="[{$item->setting_id|escape|default:''}]">
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#entry-info" aria-controls="entry-info" role="tab" data-toggle="tab">Home</a>
                    </li>
                    <li role="presentation">
                        <a href="#social-info" aria-controls="social-info" role="tab" data-toggle="tab">Contact</a></li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="entry-info">
                        <div class="row half">
                            <div class="col-mb-6 half">
                                <div class="control-group pull-top">
                                    <div>Name :</div>
                                    <input type="text" 
                                           class="form-control" value="[{$item->values.name|escape|default:'iHope'}]" 
                                        name="name" 
                                        >
                                </div>
                            </div>
                            <div class="col-mb-6 half">
                                <div class="control-group pull-top">
                                    <div>Copyright :</div>
                                    <div class="">
                                        <input type="text" 
                                                class="form-control" value="[{$item->values.copyright|escape|default:''}]" 
                                                name="copyright" 
                                                >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <fieldset>
                            <legend>Home</legend>
                            <div class="row half">
                                <div class="col-mb-6 half">
                                    <div class="control-group pull-top">
                                        <div>Home title :</div>
                                        <div class="input-append">
                                            <input type="text" 
                                                [{if $item->values.hometitle}]title="<img src='[{$item->values.hometitle}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                                class="form-control tool-tip" value="[{$item->values.hometitle|escape|default:''}]" 
                                                name="hometitle" id="_hometitle"
                                                >
                                            <span class="add-on" onclick="BrowseServer('#_hometitle')">
                                                <i class="fa fa-image"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="control-group pull-top">
                                        <div>Cover Banner :</div>
                                        <div class="input-append">
                                            <input type="text" 
                                                [{if $item->values.homebanner}]title="<img src='[{$item->values.homebanner}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                                class="form-control tool-tip" value="[{$item->values.homebanner|escape|default:''}]" 
                                                name="homebanner" id="_homebanner"
                                                >
                                            <span class="add-on" onclick="BrowseServer('#_homebanner')">
                                                <i class="fa fa-image"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-mb-6 half">
                                    <div class="control-group pull-top">
                                        <div>Popup desc :</div>
                                        <textarea 
                                            rows="4"
                                            class="form-control"
                                            name="homedesc">[{$item->values.homedesc|escape|default:''}]</textarea>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend>Footer</legend>
                            <div class="row half">
                                <div class="col-mb-6 half">
                                    <div class="control-group pull-top">
                                        <div>Contact :</div>
                                        <textarea 
                                            rows="3"
                                            class="form-control"
                                            name="contact">[{$item->values.contact|escape|default:''}]</textarea>

                                    </div>
                                </div>
                                <div class="col-mb-6 half">
                                    <div class="control-group pull-top">
                                        <div>For customer :</div>
                                        <textarea 
                                            rows="3"
                                            class="form-control"
                                            name="forcustomer">[{$item->values.forcustomer|escape|default:''}]</textarea>

                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        
                        <!-- <div class="control-group pull-top">
                            <div>About :</div>
                            <textarea 
                                rows="10"
                                class="form-control"
                                id="about"
                                name="about">[{$item->values.about|escape|default:''}]</textarea>

                        </div> -->
                    </div>
                    <div role="tabpanel" class="tab-pane" id="social-info">
                        <fieldset>
                            <legend>Contact Info</legend>
                            <div class="row half">
                                <div class="col-mb-6 half">
                                    <div class="control-group pull-top">
                                        <div>Contact title :</div>
                                        <div class="input-append">
                                            <input type="text" 
                                                [{if $item->values.contacttitle}]title="<img src='[{$item->values.contacttitle}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                                class="form-control tool-tip" value="[{$item->values.contacttitle|escape|default:''}]" 
                                                name="contacttitle" id="_contacttitle"
                                                >
                                            <span class="add-on" onclick="BrowseServer('#_contacttitle')">
                                                <i class="fa fa-image"></i>
                                            </span>
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-mb-6 half">
                                    <div class="control-group pull-top">
                                        <div>Map :</div>
                                        <textarea 
                                            rows="3"
                                            class="form-control"
                                            name="map">[{$item->values.map|escape|default:''}]</textarea>
                                    </div>
                                </div>
                                <div class="col-mb-6 half">
                                    <div class="control-group pull-top">
                                        <div>Contact desc :</div>
                                        <textarea 
                                            rows="3"
                                            class="form-control"
                                            name="contactdesc">[{$item->values.contactdesc|escape|default:''}]</textarea>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </form>
            <div class="pull-top">
                <div class="btn btn-default" title="Save" onclick="onSave()">
                    <i class="fa fa-save"></i>&nbsp;Save
                </div>
            </div>
        </div>
    </div>
</div>
[{/nocache}]