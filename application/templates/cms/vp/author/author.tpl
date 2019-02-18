
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
    </div>
</div>
<div id="iContain" class="transition iContain">
    [{include file=$smarty.const.APPPATH|cat:"templates/cms/inc/quickbar.tpl"}]
    <div class="crumbs">
        <ul class="breadcrumb"> 
            <li><a href="/cms">CMS</a></li>
            <li><a href="/cms/cp" title="">Content Provider</a></li>
            <li class="active"><span>Author</span></li>
        </ul>
    </div>
    <div id="iEntry" class="transition iEntry">
        <div id="entry-container" class="container">
            
        </div>
    </div>
    <div id="iEntryList" class="transition iEntryList">
        <div class="mark"></div>
        <div class="container">
            [{include file=$smarty.const.APPPATH|cat:"templates/cms/vp/author/entryList.tpl"}]
        </div>
    </div>
</div>
<div id="iFoot" class="transition iFoot">
    Page rendered in <strong>[{$ci->benchmark->elapsed_time()}]</strong> seconds
</div>
<div id="iEntryDialog" class="iEntryDialog" style="display:none"></div>
<iframe id="integration_asynchronous" name="integration_asynchronous" style="width: 0;height: 0;border: 0;position: absolute"></iframe>
<div id="iPop-Entry" class="iPop">
    <div class="">
        <div class="pop-body">
            <div class="iPop-content"></div>
        </div>
    </div>
</div>
[{include file=$smarty.const.APPPATH|cat:"templates/cms/auth/myaccount.tpl"}]