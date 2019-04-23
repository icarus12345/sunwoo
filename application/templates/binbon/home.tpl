[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/meta.tpl"}]
<body>
    [{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/nav.tpl"}]
    
    <div class="wrap">
        [{if $cate_detail}]
        <ol class="breadcrumb">
          <li><a href="/">Home</a></li>
          <li class="active">[{$cate_detail->_title|escape}]</li>
        </ol>
        [{/if}]
        <div id="" class="grid">
            [{foreach from=$product_list item=foo}]
                <div class="cell">
                    <div>
                        <div class="cover" style="background-image: url('[{$foo->_image|escape}]')">
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
                                        <span class="sale-discount">[{$foo->_price}] K </span>
                                        [{/if}]
                                        [{$foo->_discount}] K
                                    </div>
                                    <button class="btn btn-info" onclick="return false">Add to card</button>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            [{/foreach}]
            [{foreach from=$product_list item=foo}]
                <div class="cell">
                    <div>
                        <div class="cover" style="background-image: url('[{$foo->_image}]')">
                        </div>
                    </div>
                </div>
            [{/foreach}]
            [{foreach from=$product_list item=foo}]
                <div class="cell">
                    <div>
                        <div class="cover" style="background-image: url('[{$foo->_image}]')">
                        </div>
                    </div>
                </div>
            [{/foreach}]
            [{foreach from=$product_list item=foo}]
                <div class="cell">
                    <div>
                        <div class="cover" style="background-image: url('[{$foo->_image}]')">
                        </div>
                    </div>
                </div>
            [{/foreach}]
            [{foreach from=$product_list item=foo}]
                <div class="cell">
                    <div>
                        <div class="cover" style="background-image: url('[{$foo->_image}]')">
                        </div>
                    </div>
                </div>
            [{/foreach}]
        </div>
    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/foot.tpl"}]
</body>