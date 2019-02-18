[{if $conf|default:null}]
    [{foreach from=$conf item=f key =sec}]
        [{config_load file=$smarty.const.APPPATH|cat:"templates/"|cat:$f section=$sec}]
    [{/foreach}]
[{else}]
    [{config_load file=$smarty.const.APPPATH|cat:"templates/cms/conf/cms.conf"}]
[{/if}]
[{include file=$smarty.const.APPPATH|cat:"templates/cms/inc/meta.tpl"}]
<div id="iTopMenu" class="transition iTopMenu">
    [{include file=$smarty.const.APPPATH|cat:"templates/cms/inc/head.tpl"}]
</div>
[{include file=$smarty.const.APPPATH|cat:"templates/cms/widget/message.tpl"}]
<div id="iLeftBar" class="transition iLeftBar" >
    <div class="navigation-head">
        <img class="cms-logo" src="[{'libraries/images/tk1109_green.jpg'|base_url}]"/>CMS 1109
    </div>
    <div class="navigation-menu">
        [{include file=$smarty.const.APPPATH|cat:"templates/cms/widget/accordionMenu.tpl"}]
    [{if #sidebarTpl#}]
        [{include file=$smarty.const.APPPATH|cat:"templates/"|cat:#sidebarTpl#}]
    [{/if}]
    [{if $smarty.session.auth.user->ause_authority=='Administrator'}]
        [{include file=$smarty.const.APPPATH|cat:"templates/cms/widget/navimenuAdmin.tpl"}]
    [{/if}]
    </div>
</div>
<div id="iContain" class="transition iContain">
    [{if #quickbarTpl#}]
        [{include file=$smarty.const.APPPATH|cat:"templates/"|cat:#quickbarTpl#}]
    [{/if}]
    [{if #crumbTpl#}]
        [{include file=$smarty.const.APPPATH|cat:"templates/"|cat:#crumbTpl#}]
    [{/if}]
    <div class="transition iEntryList">
        [{if #entryListTpl#}]
            [{include file=$smarty.const.APPPATH|cat:"templates/"|cat:#entryListTpl#}]
        [{/if}]
    </div>
</div>
<div id="iFoot" class="transition iFoot">
    Page rendered in <strong>[{$ci->benchmark->elapsed_time()}]</strong> seconds
</div>
<iframe id="integration_asynchronous" name="integration_asynchronous" style="width: 0;height: 0;border: 0;position: absolute"></iframe>