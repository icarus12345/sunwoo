[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/meta.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/nav.tpl"}]

<div class="wrap">
    [{if $cate_detail}]
        <ol class="breadcrumb">
          <li><a href="/">[{$languages.default.home|escape}]</a></li>
          <li class="active">[{$cate_detail->_title|escape}]</li>
        </ol>
    [{/if}]
    <div class="top-menu">
        [{if $cate_detail->_cover}]
        <div class="banner">
            <img src="[{$cate_detail->_cover|escape}]">
        </div>
        [{/if}]
        <ul>
            [{foreach from=$categories item=foo}]
            <li>
                <a href="/shop/[{$foo->_alias|escape}]">
                    <div class="">
                        <img src="[{$foo->_image|escape}]"/>
                    </div> 
                    [{$foo->_title|escape}]
                </a>
            </li>
            [{/foreach}]
        </ul>
    </div>
    <div id="" class="grid home-grid">
        [{foreach from=$product_list item=foo}]
            <div class="cell">
                <div>
                    <div class="contain" style="background-image: url('[{$foo->_image|escape}]')">
                        <span class="label [{$foo->_label|escape}]">[{$foo->_label|escape}]</span>
                        <a href="/shop/[{$foo->cat_alias|escape}]/[{$foo->_alias|escape}]" class="mask">
                            <div class="cap">
                                <h4>[{$foo->_title|escape}]</h4>
                                <div class="ratting">
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star-half"></span>
                                </div>
                                <div class="price">
                                    [{if $foo->_discount>0}]
                                    <span class="price-no-discount">[{$foo->_price}] K </span>
                                    [{/if}]
                                    [{$foo->_discount}] K
                                </div>
                                <button class="btn btn-info" onclick="App.addToCart([{$foo->_id}])">[{$languages.default.add_to_cart|escape}]</button>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        [{foreachelse}]
        <div class="empty">[{$languages.default.no_data|escape}]</div>
        [{/foreach}]
    </div>
</div>
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/foot.tpl"}]
