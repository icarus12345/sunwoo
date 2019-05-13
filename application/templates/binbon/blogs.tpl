[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/meta.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/nav.tpl"}]

<div class="wrap">
    <ol class="breadcrumb">
      <li><a href="/">[{$languages.default.home|escape}]</a></li>
      <li class="active">[{$languages.default.blog|escape}]</li>
    </ol>
    <div class="blogs">
        [{foreach from=$news_list item=foo}]
        <div class="blog-item">
            <a href="/blogs/[{$foo->_alias|escape}]">
                <img src="[{$foo->_thumb|escape}]">
            </a>
            <div>
                <span class="public-at">[{$foo->_public_at|escape|date_format }]</span>
                <span class="author">By [{$foo->_author|escape}]</span>
                <span class="cate"><i class="fa fa-tags"></i> [{$foo->cat_title|escape}]</span>
            </div>
            <a href="/blogs/[{$foo->_alias|escape}]">
                <h3>[{$foo->_title|escape}]</h3>
                <p>[{$foo->_desc|escape}]</p>
            </a>
        </div>
        [{foreachelse}]
        <div class="empty">[{$languages.default.no_data|escape}]</div>
        [{/foreach}]
    </div>
    [{$paging}]
</div>
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/foot.tpl"}]
