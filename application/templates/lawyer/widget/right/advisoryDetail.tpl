<!-- -->
<script type="text/javascript" src="/libraries/plugin/validation-engine/jquery.validationEngine.js"></script>
<script type="text/javascript" src="/libraries/plugin/validation-engine/jquery.validationEngine-en.js"></script>
<link rel="stylesheet" type="text/css" href="/libraries/ckeditor/contents.css"/>

<div class="-container">
    
    <div class="quest-category">
        <div class="title">
            <div>Category</div>
        </div>
        [{if $news_categories}]
        <div class="dropdown">
            <button type="button" class="btn btn-mb" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Chọn danh mục tư vấn
            <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                [{foreach from=$news_categories item=foo }]
                <li>
                    <a href="/advisory/[{$foo->cat_alias|escape:'html'}]/">
                        <div class="line-clamp-1">
                            [{$foo->cat_title|escape:'html'}]
                        </div>
                    </a>
                </li>
                [{if $foo->cat_children}]
                [{foreach from=$foo->cat_children item=sfoo }]
                <li style="padding-left:20px">
                    <a href="/advisory/[{$sfoo->cat_alias|escape:'html'}]/">
                        <div class="line-clamp-1">[{$sfoo->cat_title|escape:'html'}]</div>
                    </a>
                </li>
                [{/foreach}]
                [{/if}]
                [{/foreach}]
            </ul>
        </div>
        <ul class="h-list square-dot category-list">
            [{foreach from=$news_categories item=foo }]
            <li>
                <a href="/advisory/[{$foo->cat_alias|escape:'html'}]/">
                    <div class="line-clamp-1">
                        [{$foo->cat_title|escape:'html'}]
                    </div>
                </a>
                [{if $foo->cat_children}]
                <span class="carret" data-toggle="dropdown"></span>
                <ul class="dropdown-menu" role="menu">
                [{foreach from=$foo->cat_children item=sfoo }]
                    <li>
                        <a href="/advisory/[{$sfoo->cat_alias|escape:'html'}]/">
                            <div class="line-clamp-1">[{$sfoo->cat_title|escape:'html'}]</div>
                        </a>
                    </li>
                [{/foreach}]
                </ul>
                [{/if}]
            </li>
            [{/foreach}]
        </ul>
        [{else}]
        <div class="no-data">Sorry ! No data to display.</div>
        [{/if}]
        <div class="clearfix"></div>
        <div class="space-line"></div>
    </div>
    <div class="quest-list">
        
        [{if $advisory}]
            <div><b>[{$advisory->advisory_title|escape:'html'}]</b></div>
            <div>
                <span class="date">
                    [{$advisory->cat_title|escape:'html'}] - 
                    [{$advisory->advisory_name|escape:'html'}] - 
                    [{$advisory->advisory_insert|date_format:"%a %d-%m, %Y"}]
                </span>
            </div>
            <div class="word-wrap">[{$advisory->advisory_desc|escape:'html'}]</div>
            <div class="space-line"></div>
            [{if $advisory->advisory_content}]
                <div class="gray"><b>Reply</b></div>
                <div class="ckeditor"> 
                [{$advisory->advisory_content}]
                </div>
                <div class="date text-right">[{$advisory->advisory_by}] at [{$advisory->advisory_publicday|date_format:"%a %d-%m, %Y"}]</div>
    
            [{else}]
                <div class="no-data">Updating...</div>
            [{/if}]
            <div class="space-line"></div>
        [{else}]
        <div class="no-data">Sorry ! No data to display.</div>
        [{/if}]

        <div class="title orange">
            <div>Send New Question</div>
        </div>
        <form name="advisoryForm" id="advisoryForm" target="integration_asynchronous" action="/home/nothing">
        <div class="">
            <div class="col-mb-6 half">
                <div class="half-space-line"></div>
                <div class="control-group">
                    <div>Full name :</div>
                    <input type="text" class="form-control validate[required,maxSize[255]]"
                    name="advisory_name">
                </div>
            </div>
            <div class="col-mb-6 half">
                <div class="half-space-line"></div>
                <div class="control-group">
                    <div>Category :</div>
                    <select 
                        name="advisory_category" 
                        class="form-control selectpicker validate[required]"
                        data-putto="#frmE-err-category"
                        data-live-search="true"
                        data-size="10"
                        >
                        <option value="">Nothing select</option>
                        [{foreach from=$news_categories item=foo }]
                        <option 
                            value="[{$foo->cat_id}]"
                            data-content="[{$foo->cat_title|escape:'html'}]"
                            >
                            [{$foo->cat_title|escape:'html'}]
                        </option>
                            [{if $foo->cat_children}]
                            [{foreach from=$foo->cat_children item=sfoo }]
                                <option 
                                    value="[{$sfoo->cat_id}]"
                                    data-content="<span style='padding-left:20px;'>[{$sfoo->cat_title|escape:'html'}]</span>"
                                    >
                                    [{$sfoo->cat_title|escape:'html'}]
                                </option>
                            [{/foreach}]
                            [{/if}]
                        [{/foreach}]
                    </select>
                </div>
                <div id="frmE-err-category"></div>
            </div>
            <div class="col-mb-12 half">
                <div class="half-space-line"></div>
                <div class="control-group pull-top">
                    <div>Subject :</div>
                    <input type="text" class="form-control validate[required,maxSize[255]]"
                    name="advisory_title">
                </div>
            </div>
            <div class="col-mb-12 half">
                <div class="half-space-line"></div>
                <div class="control-group pull-top">
                    <div>Question :</div>
                    <textarea rows="3" class="form-control validate[required,maxSize[4000]]" name="advisory_desc" ></textarea>
                </div>
            </div>
            <div class="col-mb-6 half">
                <div class="half-space-line"></div>
                <div class="row half">
                    <div class="col-xs-6 half">
                        <input type="text" placeholder="Captcha"
                            class="form-control validate[required,minSize[4],maxSize[4]]"
                            data-putto="#frmE-err-captcha"
                            name="captcha">
                    </div>
                    <div class="col-xs-6 half">
                        <img id="img-captcha" src="[{$smarty.session.captcha.image}]" height="28" class="pull-left" style="max-width:100%" />
                    </div>
                </div>
                <div id="frmE-err-captcha"></div>
            </div>
            <div class="col-mb-6 half">
                <div class="half-space-line"></div>
                <button type="submit" onclick="sendAdvisory()" class="btn btn-default">Submit</button>
            </div>
            <div class="clearfix"></div>
        </div>
        </form>
        <div class="space-line"></div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $('#advisoryForm .selectpicker').selectpicker();
        if($('#advisoryForm').length == 1){
            $('#advisoryForm').validationEngine({
                'scroll': false
                , prettySelect : true
                //, validateNonVisibleFields:false
            }); 
        }
    });
    function sendAdvisory(){
        if( $('#advisoryForm').validationEngine('validate') === false)return;
        var Params = $('#advisoryForm').serializeObject();
        httpRequest({
            'url'         :   '/frontend/excution/addAdvisory/',
            'data'        :   {
                Params : Params
            },
            'callback'    :   function(rsdata){
                document.getElementById('img-captcha').src = rsdata.captcha;
                if(rsdata.result<0){
                    dialogMsg(rsdata.message);
                }else{
                    dialogMsg(rsdata.message);
                    document.advisoryForm.reset();
                }
            }
        }).call();
    }
</script>