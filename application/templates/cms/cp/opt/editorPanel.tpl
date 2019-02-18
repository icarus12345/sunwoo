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
                <div class="control-group">
                    <div>Name :(*)</div>
                    <input type="text" 
                        class="form-control validate[required,minSize[2],maxSize[255]]" 
                        data-prompt-position="topLeft:0,20"
                        value="[{$item->opt_name|escape|default:''}]" 
                        name="opt_name"
                        >
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <div class="control-group pull-top">
                            <div>Price :(*)</div>
                            <div [{if $prices|default:null}]class="input-append"[{/if}]>
                                <input type="text" 
                                    class="form-control validate[required,custom[number]]" 
                                    data-prompt-position="topLeft:0,20"
                                    data-errormessage-custom-error="Numbers only"
                                    value="[{$item->opt_price|escape|default:''}]" 
                                    min="0"
                                    name="opt_price"
                                    >
                                [{if $prices|default:null}]
                                <div class="add-on dropdown" 
                                    title="Choose Image"
                                    style="padding:0" 
                                    onclick="">
                                    <i  class="fa fa-angle-down dropdown-toggle" 
                                        data-toggle="dropdown"
                                        title="Choose Price"
                                        style="padding:4px 8px" 
                                        ></i>
                                    <ul class="dropdown-menu pull-right" role="menu" 
                                        style="max-height:180px;overflow-y: auto;"
                                        >
                                            [{foreach from=$prices item=c}]
                                            [{if $c->opt_price|trim}]
                                            <li>
                                                <a href="JavaScript:" onclick="document.entryOptForm.opt_price.value='[{$c->opt_price|escape|default:''}]'">
                                                    
                                                    [{$c->opt_price|escape|default:''}]
                                                </a>
                                            </li>
                                            [{/if}]
                                            [{/foreach}]
                                    </ul>
                                </div>
                                [{/if}]
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="control-group pull-top">
                            <div>Amount :(*)</div>
                            <input type="number" 
                                class="form-control validate[required,custom[integer],min[0],max[9999]]"
                                data-prompt-position="topLeft:0,20" 
                                value="[{$item->opt_amount|escape|default:''}]"
                                min="0" max="9999"
                                name="opt_amount"
                                >
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <div class="control-group pull-top">
                            <div>Color :</div>
                            <div [{if $colors|default:null}]class="input-append"[{/if}]>
                                <input type="text" 
                                    class="form-control colorpicker" 
                                    value="[{$item->opt_color|escape|default:''}]" 
                                    name="opt_color"
                                    >
                                [{if $colors|default:null}]
                                <div class="add-on dropdown" 
                                    style="padding: 0" 
                                    title="Choose Color" >
                                    <i  class="fa fa-angle-down dropdown-toggle" 
                                        data-toggle="dropdown" 
                                        style="padding:4px 8px" ></i>
                                    <ul class="dropdown-menu pull-right" role="menu" 
                                        style="max-height:180px;overflow-y: auto;"
                                        >
                                        [{assign var="divid" value=-1}]
                                        [{foreach from=$colors item=c}]
                                        [{if $c->opt_color|trim}]
                                            [{if $divid==1 && $c->active==0}]
                                                [{assign var="divid" value=0}]
                                                <li class="divider"></li>
                                            [{/if}]
                                            <li>
                                                <a href="JavaScript:" onclick="document.entryOptForm.opt_color.value='[{$c->opt_color|escape|default:''}]'">
                                                    <div class="opt-color" 
                                                        style="background:[{$c->opt_color|escape|default:''}]">
                                                    </div>
                                                    [{if $c->active>=1}]
                                                        [{if $divid==-1}]
                                                            [{assign var="divid" value=1}]
                                                        [{/if}]
                                                        <b>[{$c->opt_color|escape|default:''}]</b>
                                                    [{else}]
                                                        [{$c->opt_color|escape|default:''}]
                                                    [{/if}]
                                                    <div class="clearfix"></div>
                                                </a>
                                            </li>
                                        [{/if}]
                                        [{/foreach}]
                                        
                                    </ul>
                                </div>
                                [{/if}]
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">        
                        <div class="control-group pull-top">
                            <div>Size :</div>
                            <div [{if $sizes|default:null}]class="input-append"[{/if}]>
                                <input type="text" 
                                    class="form-control" 
                                    value="[{$item->opt_size|escape|default:''}]" 
                                    name="opt_size"
                                    >
                                [{if $sizes|default:null}]
                                <div class="add-on dropdown" 
                                    title="Choose Size"
                                    style="padding: 0" >
                                    <i  class="fa fa-angle-down dropdown-toggle" 
                                        style="padding:4px 8px"
                                        data-toggle="dropdown"></i>
                                    <ul class="dropdown-menu pull-right" role="menu" 
                                        style="max-height:180px;overflow-y: auto;"
                                        >
                                        [{assign var="divid" value=-1}]
                                        [{foreach from=$sizes item=c}]
                                        [{if $c->opt_size|trim}]
                                            [{if $divid==1 && $c->active==0}]
                                                [{assign var="divid" value=0}]
                                                <li class="divider"></li>
                                            [{/if}]
                                        <li>
                                            <a href="JavaScript:" onclick="document.entryOptForm.opt_size.value='[{$c->opt_size|escape|default:''}]'">
                                                [{if $c->active>=1}]
                                                    [{if $divid==-1}]
                                                        [{assign var="divid" value=1}]
                                                    [{/if}]
                                                    <b>[{$c->opt_size|escape|default:''}]</b>
                                                [{else}]
                                                    [{$c->opt_size|escape|default:''}]
                                                [{/if}]
                                            </a>
                                        </li>
                                        [{/if}]
                                        [{/foreach}]
                                    </ul>
                                </div>
                                [{/if}]
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
[{/nocache}]