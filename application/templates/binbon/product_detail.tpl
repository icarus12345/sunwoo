[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/meta.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/nav.tpl"}]

<div class="wrap">
    <ol class="breadcrumb">
      <li><a href="/">[{$languages.default.home|escape}]</a></li>
      <li><a href="/shop/[{$cate_detail->_alias|escape}]">[{$cate_detail->_title|escape}]</a></li>
      <li class="active">[{$product_detail->_code|escape}]</li>
    </ol>
    <div class="product-detail row">
        <div class="col-sm-6">
            <div class="product-thumbs" id="product-thumbs">
                <span class="label [{$product_detail->_label|escape}]">[{$product_detail->_label|escape}]</span>
                [{foreach from=$product_detail->_data.images item=imgs key=name}]
                    <div class="owl-carousel [{if $name=='default'}]owl-active[{/if}]" data-owlid="[{$name}]">
                        [{foreach from=$imgs item=img}]
                        <div class="item">
                            <div><img src="[{$img|escape}]" alt="[{$product_detail->_title|escape}]"></div>
                        </div>
                        [{/foreach}]
                    </div>
                [{/foreach}]
                <div class="owl-carousel [{if !$product_detail->_data.images}]owl-active[{/if}]" data-owlid="unknown">
                    <div class="item">
                        <div><img src="[{$product_detail->_image|escape}]" alt="[{$product_detail->_title|escape}]"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 product-info">
            <h1>[{$product_detail->_title|escape}]</h1>
            <div class="ratting">
                <span class="fa fa-star"></span>
                <span class="fa fa-star"></span>
                <span class="fa fa-star"></span>
                <span class="fa fa-star"></span>
                <span class="fa fa-star-half"></span>
            </div>
            <div class="price">
                [{if $product_detail->_discount>0}]
                <span class="price-no-discount">[{$product_detail->_price}] K </span>
                [{/if}]
                <span class="price-with-discount">[{$product_detail->_discount}] K </span>
            </div>
            <p class="desc word-wrap">[{$product_detail->_desc|escape}]</p>
            <form >
                <input type="hidden" name="id" value="[{$product_detail->_id}]">
                <div class="row half select-option">
                    [{if $product_detail->_data.custom[$fecog.color]}]
                    <div class="col-sm-4 half form-group">
                        <div class="">[{$languages.default.color|escape}]</div>
                        <div>
                            <select id="colorCbx" class="selectpicker" name="color">
                                <option value="default"></option>
                                [{foreach from=$colors item=line}]
                                [{if $line->_id|in_array:$product_detail->_data.custom[$fecog.color]}]
                                <option 
                                    data-content="<span style='background-color:[{$line->_data.color|escape}]' class='sub-icon'></span>[{$line->_title|escape}]"
                                    value="[{$line->_id}]" 
                                    >[{$line->_title}]</option>
                                [{/if}]
                                [{/foreach}]
                            </select>
                        </div>
                    </div>
                    [{/if}]
                    [{if $product_detail->_data.custom[$fecog.materia]}]
                    <div class="col-sm-4 half form-group">
                        <div class="">[{$languages.default.materia|escape}]</div>
                        <div>
                            <select id="materiaCbx" class="selectpicker" name="materia">
                                <option value="default"></option>
                                [{foreach from=$materias item=line}]
                                [{if $line->_id|in_array:$product_detail->_data.custom[$fecog.materia]}]
                                <option value="[{$line->_id}]">[{$line->_title}]</option>
                                [{/if}]
                                [{/foreach}]
                            </select>
                        </div>
                    </div>
                    [{/if}]
                    [{if $product_detail->_data.custom[$fecog.size]}]
                    <div class="col-sm-4 half form-group">
                        <div class="">[{$languages.default.size|escape}]</div>
                        <div>
                            <select id="sizeCbx" class="selectpicker" name="size">
                                <option value="default"></option>
                                [{foreach from=$sizes item=line}]
                                [{if $line->_id|in_array:$product_detail->_data.custom[$fecog.size]}]
                                <option value="[{$line->_id}]">[{$line->_title}]</option>
                                [{/if}]
                                [{/foreach}]
                            </select>
                        </div>
                    </div>
                    [{/if}]
                </div>
                <div class="cate">[{$languages.default.category|escape}]: [{$cate_detail->_title|escape}]</div>
                <div class="supplier">[{$languages.default.supplier|escape}]: [{$product_detail->supplier_title|escape}]</div>
                <div class="tags">[{$languages.default.tags|escape}]: [{$product_detail->_tag|escape}]</div>
                <br/>
                <div class="row">
                    <div class="col-sm-4" style="max-width: 180px">
                        <div class="input-group snippet">
                          <span class="input-group-btn">
                              <button type="button" class="btn btn-default btn-number" data-type="minus" >
                                  <span class="glyphicon glyphicon-chevron-left"></span>
                              </button>
                          </span>
                          <input type="text" name="quantity" class="form-control input-number" value="1" min="1" max="10">
                          <span class="input-group-btn">
                              <button type="button" class="btn btn-default btn-number" data-type="plus">
                                  <span class="glyphicon glyphicon-chevron-right"></span>
                              </button>
                          </span>
                        </div>
                        <br/>
                    </div>
                    <div class="col-sm-8">
                        <button class="btn btn-primary" type="submit">[{$languages.default.add_to_cart|escape}]</button>
                        <br/>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="product-content">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#tab-desc" aria-controls="tab-desc" role="tab" data-toggle="tab">[{$languages.default.description|escape}]</a></li>
            <li role="presentation"><a href="#tab-review" aria-controls="tab-review" role="tab" data-toggle="tab">[{$languages.default.review|escape}]</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="tab-desc">
                <div class="ckeditor">[{$product_detail->_content}]</div>
            </div>
            <div role="tabpanel" class="tab-pane" id="tab-review">
                <div id="wpac-comment"></div>
                <script type="text/javascript">
                wpac_init = window.wpac_init || [];
                wpac_init.push({widget: 'Comment', id: 17753});
                (function() {
                    if ('WIDGETPACK_LOADED' in window) return;
                    WIDGETPACK_LOADED = true;
                    var mc = document.createElement('script');
                    mc.type = 'text/javascript';
                    mc.async = true;
                    mc.src = 'https://embed.widgetpack.com/widget.js';
                    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(mc, s.nextSibling);
                })();
                </script>

            </div>
        </div>
    </div>
    <div class="related">
        <div>[{$languages.default.related_product|escape}]</div>
        <div id="" class="grid">
            [{foreach from=$relateds item=foo}]
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
            [{/foreach}]
        </div>
    </div>
</div>
<script type="text/javascript">
    // var price_incurred = [{$product_detail->_data.price_incurred|json_encode}]
    var product_detail = {
        _title: [{$product_detail->_title|json_encode}],
        _price: [{$product_detail->_price|json_encode}],
        _discount: [{$product_detail->_discount|json_encode}],
        _image: [{$product_detail->_image|json_encode}],
        _alias: [{$product_detail->_alias|json_encode}],
        _data: [{$product_detail->_data|json_encode}],
        colors: [{$product_detail->colors|json_encode}],
        sizes: [{$product_detail->sizes|json_encode}],
        materias: [{$product_detail->materias|json_encode}],
    }
</script>
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/foot.tpl"}]
