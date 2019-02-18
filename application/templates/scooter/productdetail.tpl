[{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/meta.tpl"}]
<body class="scoo-detail">
    <div class="bg-body">
        <div class="nailthumb-mark"></div>
		[{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/menu.tpl"}]
		<div class="main-page">
            <div class="container half">
                <div class="space-line"></div>
                <div class="space-line"></div>
                <div class="space-line"></div>
                <div class="space-line"></div>
                <div class="sm-space-line"></div>
                <div class="sm-space-line"></div>
                <div class="sm-space-line"></div>
                <div class="sm-space-line"></div>
                [{if $product->product_images|default:''!=''}]
                    [{assign var=images value='/\r\n|[\r\n]/'|preg_split:$product->product_images}]
                [{/if}]
                <div class="row">
                    <div class="col-sm-6 half">
                        <div style="position:relative;padding-bottom: 100%">
                            <div id="gallery" class="owl-carousel">
                                [{foreach from=$images item=img}]
                                    <div class="item" style="background-image:url('[{$img}]');"></div>
                                [{/foreach}]
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 half">
                        <div id="gallery-thumb" style="padding:0 20px">
                            <div id="owl-thumb-gallery" class="owl-carousel" >
                                [{foreach from=$images item=img}]
                                    <div class="item">
                                        <div style="background-image:url('[{$img}]');"></div>
                                    </div>
                                [{/foreach}]
                            </div>
                        </div>
                        <div class="product-info white">
                            <h2 class="big-title">[{$product->product_title|escape:'html'}]</h2>
                            <div>
                                [{$product->product_content}]
                            </div>
                        </div>
                    </div>
                </div>
                <div class="space-line"></div>
                <div class="space-line"></div>
                <div class="sm-space-line"></div>
                <div class="sm-space-line"></div>
            </div>
        </div>
    </div>
    <div class="tracker-body">
        <div class="container half c-gray">
            <div class="space-line"></div>
            <div class="space-line"></div>
            <div class="sm-space-line"></div>
            <div class="sm-space-line"></div>
            <div class="row half">SCOOTERS / [{$cat->cat_title|escape:'html'}] / <span class="c-white">[{$product->product_title|escape:'html'}]</span></div>
            <div class="-row">
                <div class="col-sm-6 half">
                    <div class="space-line"></div>
                    <div class="sm-space-line"></div>
                    <div class="product-box">
                        <h3 class="normal-title c-white">[{$product->product_title|escape:'html'}]</h3>
                        <div class="code">Product code : [{$product->product_code|escape:'html'}]</div>
                        <span class="big-title c-white">$ [{$product->product_price|default:'0.00'|escape:'html'}]</span>
                        <div class="space-line"></div>
                    </div>
                    <div class="space-line"></div>
                    <div class="word-wrap">[{$product->product_desc|escape:'html'}]</div>
                    <div class="space-line"></div>
                    <div class="space-line"></div>
                    <div><span class="c-white">Tags : </span> park, white, scooter</div>
                </div>
                [{assign var=data value=$product->product_data|json_decode:'true'}]
                <div class="col-sm-5 half col-sm-push-1">
                    <div class="space-line"></div>
                    <div class="sm-space-line"></div>
                    <div class="row">
                        <div class="col-xs-6">
                            <div class="n-label">Color</div>
                            <div class="space-line"></div>
                        </div>
                        <div class="col-xs-6">
                            <select class="form-input selectpicker dark" id="product-color">
                            [{foreach from=$data.color item=foo}]
                                <option>[{$foo}]</option>
                            [{/foreach}]
                            </select>
                            <div class="space-line"></div>
                        </div>
                        <!-- <div class="col-xs-6">
                            <div class="n-label">Option</div>
                            <div class="space-line"></div>
                        </div>
                        <div class="col-xs-6">
                            <select class="form-input selectpicker dark">
                                <option>White</option>
                                <option>Red</option>
                                <option>Orange</option>
                                <option>Good - Slien</option>
                            </select>
                            <div class="space-line"></div>
                        </div> -->
                        <div class="col-xs-6">
                            <div class="n-label">Quantity</div>
                            <div class="space-line"></div>
                        </div>
                        <div class="col-xs-6">
                            <input id="product-quantity" type="text" class="form-input" value="1" />
                            <div class="space-line"></div>
                        </div>
                        <div class="col-xs-6">
                            <button class="btn btn-default btn-block" type="button" onclick="addToCart()">ADD TO CART</button>
                        </div>

                        <div class="col-xs-6">
                            <button class="btn btn-primary btn-block">PURCHASE</button>
                        </div>
                    </div>
                    <div class="space-line"></div>
                    <div class="sm-space-line"></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function(){
            $( "#product-quantity" ).spinner({min: 0 , max : 10});
            $('#product-color').selectpicker();
        });
        function addToCart(){
            var color = $('#product-color').val();
            var quantity = $('#product-quantity').val();
            if(quantity<=0){
                dialogMsg('Quantity must be less than rezo.')
                return;
            }
            httpRequest({
                'url': '/frontend/cart/onAddToCart',
                'data': {
                    'id' : '[{$product->product_id}]',
                    'color' : color,
                    'quantity' : quantity
                },
                'callback': function(rsdata) {
                    if (rsdata.result < 0) {
                        dialogMsg(rsdata.message);
                    } else {
                        dialogMsg(rsdata.message);
                        $('.cart-menu').html(rsdata.cartinfo);
                        $(".cart-menu img.lazy").lazyload({
                           load: function() {
                               $(this).removeClass('lazy');
                               $(this.parentNode).nailthumb();
                           }
                        });
                    }
                }
            }).call();
        }
    </script>
    [{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/foot.tpl"}]