[{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/meta.tpl"}]
<body class="scoo-detail" style="background : #262626">
    <div class="bg-body" >
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
                <style type="text/css">
                .big-cart{width: 100%;border: 1px solid #333;}
                .big-cart>tbody>tr>td{padding: 10px;border-top: 1px solid #333;}
                .big-cart>tr>td{padding: 5px}
                .fa-close{cursor: pointer;}
                hr.dark{border-top: 1px solid #333;}
                </style>
                <div class="col-sm-8 c-gray">
                    
                    <table class="big-cart">
                        <tr>
                            <td colspan="2">
                                <h2 class="big-title">MY CART</h2>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                Product
                            </td>
                        </tr>
                        [{foreach from=$smarty.session.cart.items item=item key=product_id}]
                        [{foreach from=$item item=foo key=color}]
                        <tr>
                            <td width="160">
                                <div class="nailthumb">
                                    <div class="nailthumb-figure-square">
                                        <div class="nailthumb-container">
                                            <img data-original="[{$foo->product_thumb}]" class="lazy">
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <a href="/frontend/cart/removeitem/[{$product_id}]/[{$color}]" class="pull-right fa fa-close"></a>
                                <div>
                                    [{$foo->product_title}]
                                </div>
                                <div class="space-line"></div>
                                <table>
                                    [{if $color}]
                                    <tr>
                                        <td>Color : </td>
                                        <td>[{$color}]</td>
                                    </tr>
                                    [{/if}]
                                    <tr>
                                        <td>Price : </td>
                                        <td>$ [{$foo->product_price|string_format:"%.2f"}]</td>
                                    </tr>
                                    <tr>
                                        <td>Quantiry : </td>
                                        <td>$ [{$foo->quantity}]</td>
                                    </tr>
                                    <tr>
                                        <td>Total Cost : </td>
                                        <td>$ [{($foo->product_price*$foo->quantity)|string_format:"%.2f"}]</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        [{/foreach}]
                        [{foreachelse}]
                        <tr>
                            <td colspan="2">
                                No items.
                            </td>
                        </tr>
                        [{/foreach}]
                    </table>
                    <div class="space-line"></div>
                    <div class="space-line"></div>
                </div>
                <div class="col-sm-4 c-gray">
                    <h2 class="big-title">SUMARY</h2>
                    <hr class="dark"/>
                    <div class="space-line"></div>
                    Subtotal <span class="pull-right c-white">$ [{$smarty.session.cart.info.cash|default:'0.00'}]</span>
                    <div class="space-line"></div>
                    Tax <span class="pull-right c-white">10%</span>
                    <div class="space-line"></div>
                    <table class="big-cart">
                        <tr>
                            <td>
                            <h2 class="big-title text-left">TOTAL <span class="pull-right c-white">$ [{$smarty.session.cart.info.cash|default:'0.00'}]</span></h2>
                            </td>
                        </tr>
                    </table>
                    <div class="space-line"></div>
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="/checkout"><button class="btn btn-default btn-block" type="button" onclick="">Check out</button></a>
                        </div>
                        <div class="col-xs-6">
                            <a href="/paypal/transactioncheckout"><button class="btn btn-primary btn-block">Paypal</button></a>
                        </div>
                    </div>
                    <div class="space-line"></div>
                    <div class="space-line"></div>
                    <center>
                        <a href="/paypal/transactioncheckout"><img src="/assets/scooter/images/pay.png"></a>
                    </center>
                    <div class="space-line"></div>
                    <div class="space-line"></div>
                </div>
                <div class="space-line"></div>
                <div class="space-line"></div>
                <div class="sm-space-line"></div>
                <div class="sm-space-line"></div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
        $(document).ready(function(){
            
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