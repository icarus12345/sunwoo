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
                    <form name="checkoutForm" id="checkoutForm" target="integration_asynchronous">
                    <table class="big-cart">
                        <tr>
                            <td colspan="2">
                                <!-- <h2 class="big-title">SHIPPING ADDRESS</h2> -->
                                SHIPPING ADDRESS
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="space-line"></div>
                                <div class="row">
                                    <div class="col-mb-6">
                                        <div class="input-group">
                                            <input 
                                                value="[{$smarty.session.accountInfo->data.order_shipping_name}]" 
                                                name="order_shipping_name" 
                                                class="form-control dark validate[required,minSize[4],maxSize[255]]" placeholder="Name">
                                        </div>
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                    </div>
                                    <div class="col-mb-6">
                                        <div class="input-group password-control">
                                            <input 
                                                value="[{$smarty.session.accountInfo->data.order_shipping_city}]" 
                                                name="order_shipping_city" 
                                                class="form-control dark validate[required,minSize[2],maxSize[255]]" placeholder="City">
                                        </div>
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-mb-6">
                                        <div class="input-group">
                                            <input 
                                                value="[{$smarty.session.accountInfo->data.order_shipping_address}]" 
                                                name="order_shipping_address" 
                                                class="form-control dark validate[required,minSize[4],maxSize[255]]" placeholder="Address">
                                        </div>
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                    </div>
                                    <div class="col-mb-6">
                                        <div class="input-group password-control">
                                            <input 
                                                value="[{$smarty.session.accountInfo->data.order_shipping_postal}]" 
                                                name="order_shipping_postal" 
                                                class="form-control dark validate[required,minSize[4],maxSize[10]]" placeholder="Postal code">
                                        </div>
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-mb-6">
                                        <div class="input-group">
                                            <input 
                                                name="order_shipping_phone" 
                                                value="[{$smarty.session.accountInfo->data.order_shipping_phone}]" 
                                                class="form-control dark validate[required,minSize[4],maxSize[12]]" placeholder="Mobile/Phone">
                                        </div>
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                    </div>
                                    <div class="col-mb-6">
                                        <div class="" style="position:relative">
                                            <select class="form-input selectpicker dark validate[required]" 
                                                name="order_shipping_country" 
                                                data-live-search="true" data-size="6"
                                                data-putto='.order_shipping_country_err'
                                                >
                                                <option value="">Select Country</option>
                                                [{foreach from=$countrys item=c}]
                                                <option [{if $c==$smarty.session.accountInfo->data.order_shipping_country}]selected[{/if}]>[{$c}]</option>
                                                [{/foreach}]
                                            </select>
                                        </div>
                                        <div class="order_shipping_country_err"></div>
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <!-- <h2 class="big-title">SHIPPING ADDRESS</h2> -->
                                BILLING ADDRESS
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="space-line"></div>
                                <div class="row">
                                    <div class="col-mb-6">
                                        <div class="input-group">
                                            <input 
                                                value="[{$smarty.session.accountInfo->data.order_billing_name}]" 
                                                name="order_billing_name" 
                                                class="form-control dark validate[required,minSize[4],maxSize[255]]" placeholder="Name">
                                        </div>
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                    </div>
                                    <div class="col-mb-6">
                                        <div class="input-group password-control">
                                            <input 
                                                value="[{$smarty.session.accountInfo->data.order_billing_city}]" 
                                                name="order_billing_city" 
                                                class="form-control dark validate[required,minSize[2],maxSize[255]]" placeholder="City">
                                        </div>
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-mb-6">
                                        <div class="input-group">
                                            <input 
                                                value="[{$smarty.session.accountInfo->data.order_billing_address}]" 
                                                name="order_billing_address" 
                                                class="form-control dark validate[required,minSize[4],maxSize[255]]" placeholder="Address">
                                        </div>
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                    </div>
                                    <div class="col-mb-6">
                                        <div class="input-group password-control">
                                            <input 
                                                name="order_billing_postal" 
                                                value="[{$smarty.session.accountInfo->data.order_billing_postal}]" 
                                                class="form-control dark validate[required,minSize[4],maxSize[10]]" placeholder="Postal code">
                                        </div>
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-mb-6">
                                        <div class="input-group">
                                            <input 
                                                name="order_billing_phone" 
                                                value="[{$smarty.session.accountInfo->data.order_billing_phone}]" 
                                                class="form-control dark validate[required]" placeholder="Mobile/Phone">
                                        </div>
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                    </div>
                                    <div class="col-mb-6">
                                        <div class="" style="position:relative">
                                            <select 
                                                name="order_billing_country" 
                                                data-live-search="true" data-size="6"
                                                data-putto='.order_billing_country_err'
                                                class="form-input selectpicker dark validate[required]">
                                                <option value="">Select Country</option>
                                                [{foreach from=$countrys item=c}]
                                                <option [{if $c==$smarty.session.accountInfo->data.order_billing_country}]selected[{/if}]>[{$c}]</option>
                                                [{/foreach}]
                                            </select>
                                        </div>
                                        <div class="order_billing_country_err"></div>
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                    </div>
                                </div>
                                <div class="space-line"></div>
                                <div class="space-line"></div>
                                <div class="row">
                                    <div class="col-mb-6">
                                        <div class="input-group">
                                            <input 
                                                name="order_billing_email" 
                                                value="[{$smarty.session.accountInfo->data.order_billing_email}]" 
                                                class="form-control dark validate[required,custom[email]]" placeholder="Email">
                                        </div>
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                    </div>
                                    <div class="col-mb-6">
                                        WE WILL SEND YOU THE RECEIPT VIA THIS EMAIL
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
                <div class="col-sm-4 c-gray">
                    <h2 class="big-title">PRICE SUMARY</h2>
                    <hr class="dark"/>
                    <div class="space-line"></div>
                    Subtotal <span class="pull-right c-white">$ [{$smarty.session.cart.info.cash|default:'0.00'}]</span>
                    <div class="space-line"></div>
                    Tax <span class="pull-right c-white">10%</span>
                    <div class="space-line"></div>
                    <div class="space-line"></div>
                    <table class="big-cart">
                        <tr>
                            <td>
                            <h2 class="big-title text-left">TOTAL <span class="pull-right c-white">$ [{$smarty.session.cart.info.cash|default:'0.00'}]</span></h2>
                            </td>
                        </tr>
                    </table>
                    <div class="space-line"></div>
                    <div class="space-line"></div>
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="/cart"><button class="btn btn-default btn-block" type="button" >BACK</button></a>
                        </div>
                        <div class="col-xs-6">
                            <button id="btnCheckout" type="button" class="btn btn-primary btn-block" onclick="confirmCheckout()">COMPLETE</button>
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
    <div class="sm-space-line"></div>
    <div class="sm-space-line"></div>
    <div class="sm-space-line"></div>
    <div class="sm-space-line"></div>
    <div id="confirmCheckout" class="dialog transition" style="z-index:1110;">
        <div class="content transition">
            <div class="">
                <div class="head"><span>CONFIRM CHECKOUT !</span> <i class="pull-right fa fa-close" onclick="dialog('confirmCheckout')"></i></div>
                <div class="body">
                    <div class="space-line"></div>
                    <div class="space-line"></div>
                    DO YOU WANT THIS ORDER?
                    <div class="space-line"></div>
                    <div class="space-line"></div>
                    <div class="row">
                        <div class="col-xs-6">
                            <button class="btn btn-default btn-block" onclick="checkout()">Confirm</button>
                        </div>
                        <div class="col-xs-6">
                            <button class="btn btn-default btn-block" onclick="dialog('confirmCheckout')">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function(){
            if($('#checkoutForm').length==1)
                $('#checkoutForm').validationEngine({
                    'scroll': false
                    , 
                    'isPopup' : false
                    , 
                    prettySelect : true
                //, validateNonVisibleFields:false
                });
        });
        function confirmCheckout(){
            if( $('#checkoutForm').validationEngine('validate') === false)return;
            dialog('confirmCheckout');
        }
        function checkout(){
            dialog('confirmCheckout');
            if( $('#checkoutForm').validationEngine('validate') === false)return;
            var params = $('#checkoutForm').serializeObject();
            httpRequest({
                'url': '/frontend/cart/onckeckout',
                'data': {
                    'params' : params
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
                        $('#btnCheckout').parent().remove();
                    }
                }
            }).call();
        }
    </script>
    [{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/foot.tpl"}]