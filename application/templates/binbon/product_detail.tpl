[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/meta.tpl"}]
<body>
    [{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/nav.tpl"}]
    
    <div class="wrap">
        <ol class="breadcrumb">
          <li><a href="/">Home</a></li>
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
                
                <div class="row half select-option">
                    <div class="col-sm-4 half form-group">
                        <div class="">Color</div>
                        <div>
                            <select id="colorCbx" class="selectpicker">
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
                    <div class="col-sm-4 half form-group">
                        <div class="">Materia</div>
                        <div>
                            <select id="materiaCbx" class="selectpicker">
                                <option value="default"></option>
                                [{foreach from=$materias item=line}]
                                [{if $line->_id|in_array:$product_detail->_data.custom[$fecog.materia]}]
                                <option value="[{$line->_id}]">[{$line->_title}]</option>
                                [{/if}]
                                [{/foreach}]
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4 half form-group">
                        <div class="">Size</div>
                        <div>
                            <select id="sizeCbx" class="selectpicker">
                                <option value="default"></option>
                                [{foreach from=$sizes item=line}]
                                [{if $line->_id|in_array:$product_detail->_data.custom[$fecog.size]}]
                                <option value="[{$line->_id}]">[{$line->_title}]</option>
                                [{/if}]
                                [{/foreach}]
                            </select>
                        </div>
                    </div>
                </div>
                <div class="cate">Category: [{$cate_detail->_title|escape}]</div>
                <div class="supplier">Supplier: [{$product_detail->supplier_title|escape}]</div>
                <div class="tags">Tags: [{$product_detail->_tag|escape}]</div>
                <div class="submit">
                    <button class="btn btn-primary">Add to cart</button>
                </div>

            </div>
        </div>
        <div class="product-content">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#tab-desc" aria-controls="tab-desc" role="tab" data-toggle="tab">Description</a></li>
                <li role="presentation"><a href="#tab-review" aria-controls="tab-review" role="tab" data-toggle="tab">Review</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="tab-desc">
                    <div class="ckeditor">[{$product_detail->_content}]</div>
                </div>
                <div role="tabpanel" class="tab-pane" id="tab-review">
                    Updating...<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                </div>
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
</body>