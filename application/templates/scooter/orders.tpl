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
                    [{foreach from=$orders item=foo}]
                    [{assign var="odata" value=$foo->order_data|json_decode:true}]
                    <table class="big-cart">
                        <tr>
                            <td colspan="5">
                                ORDER ID : [{$foo->order_id}]
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                Created : [{$foo->order_insert}]<br/>
                                TOTAL : $ [{$foo->order_total}]<br/>
                                Status : [{$foo->order_status}]
                                <div class="space-line"></div>
                                <div class="space-line"></div>
                                <div class="space-line"></div>
                                <div class="row">
                                    <div class="col-mb-6">
                                        SHIPPING<br/>
                                        Name : [{$odata.info.order_shipping_name}]<br/>
                                        City : [{$odata.info.order_shipping_city}]<br/>
                                        Address : [{$odata.info.order_shipping_address}]<br/>
                                        Postal : [{$odata.info.order_shipping_postal}]<br/>
                                        Phone : [{$odata.info.order_shipping_phone}]<br/>
                                        Country : [{$odata.info.order_shipping_country}]
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                    </div>
                                    <div class="col-mb-6">
                                        BILLING<br/>
                                        Name : [{$odata.info.order_billing_name}]<br/>
                                        City : [{$odata.info.order_billing_city}]<br/>
                                        Address : [{$odata.info.order_billing_address}]<br/>
                                        Postal : [{$odata.info.order_billing_postal}]<br/>
                                        Phone : [{$odata.info.order_billing_phone}]<br/>
                                        Country : [{$odata.info.order_billing_country}]
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Product</td>
                            <td>Color</td>
                            <td>Price</td>
                            <td>Quantity</td>
                            <td>$</td>
                        </tr>
                        [{foreach from=$odata.items item=c }]
                        [{foreach from=$c item=p key=color}]
                        <tr>
                            <td>[{$p.product_title}]</td>
                            <td>[{$color}]</td>
                            <td>[{$p.product_price}]</td>
                            <td>[{$p.quantity}]</td>
                            <td>[{$p.cash}]</td>
                        </tr>
                        [{/foreach}]
                        [{/foreach}]
                    </table>
                    <div class="space-line"></div>
                    <div class="space-line"></div>
                    [{/foreach}]
                </div>
                <div class="col-sm-4 c-gray">
                    <div class="space-line"></div>
                    <div class="">USER INFO <a class="pull-right" href="JavaScript:dialog('account')">Edit</a></div>
                    <hr class="dark"/>
                    <div class="space-line"></div>
                    First Name <span class="pull-right c-white">[{$smarty.session.accountInfo->FirstName}]</span>
                    <div class="space-line"></div>
                    <div class="space-line"></div>
                    Last Name <span class="pull-right c-white">[{$smarty.session.accountInfo->LastName}]</span>
                    <div class="space-line"></div>
                    <div class="space-line"></div>
                    Email <span class="pull-right c-white">[{$smarty.session.accountInfo->Email}]</span>
                    <div class="space-line"></div>
                    <div class="space-line"></div>
                    Password <span class="pull-right c-white">*****</span>
                    <div class="space-line"></div>
                    <div class="space-line"></div>

                    <hr class="dark"/>
                    <div class="">PURCHASE HISTORY <a class="pull-right" href="/account/orders">View All</a></div>
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

    [{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/foot.tpl"}]