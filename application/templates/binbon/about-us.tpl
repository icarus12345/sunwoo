[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/meta.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/nav.tpl"}]

<div class="wrap">
    [{if $cate_detail}]
        <ol class="breadcrumb">
          <li><a href="/">Home</a></li>
          <li><a href="/">Pages</a></li>
          <li class="active">About us</li>
        </ol>
    [{/if}]
    
</div>
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/foot.tpl"}]
