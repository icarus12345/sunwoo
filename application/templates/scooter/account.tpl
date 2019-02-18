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
                    <form name="infoForm" id="infoForm" target="integration_asynchronous">
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
                                        <div class="space-line"></div>
                                        <div class="space-line"></div>
                                        <div class="row">
					                        <div class="col-xs-6">
					                        </div>
					                        <div class="col-xs-6">
					                            <button id="btnSave" type="button" class="btn btn-primary btn-block" onclick="updateAccount()">SAVE</button>
					                        </div>
					                    </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    </form>
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
<div id="account" class="dialog transition" style="z-index:1110;">
    <div class="content transition">
        <div class="" style="max-width:480px">
            <div class="head"><span>UPDATE ACCOUNT !</span> <i class="pull-right fa fa-close" onclick="dialog('account')"></i></div>
            <div class="body">
            <form name="updForm" id="updForm" target="integration_asynchronous">
                <div class="row half">
                    <div class="col-xs-6 half">
                        <div class="input-group">
                            <input name="FirstName" 
                            	value="[{$smarty.session.accountInfo->FirstName}]" 
                            	class="form-control dark validate[required,minSize[4],maxSize[255]]" 
                            	placeholder="First name"/>
                        </div>
                        <div class="space-line"></div>
                    </div>
                    <div class="col-xs-6 half">
                        <div class="input-group">
                            <input name="LastName" 
                            	value="[{$smarty.session.accountInfo->LastName}]" 
                            	class="form-control dark validate[required,minSize[4],maxSize[255]]" 
                            	placeholder="Last name"/>
                        </div>
                        <div class="space-line"></div>
                    </div>
                </div>
                <div class="row half">
                    <div class="col-xs-12 half">
                        <div class="input-group">
                            <input name="Email" 
                            	value="[{$smarty.session.accountInfo->Email}]" 
                            	class="form-control dark validate[required,custom[email]]" placeholder="Email"/>
                        </div>
                        <div class="space-line"></div>
                    </div>
                </div>
                <div class="row half">
                    <div class="col-xs-6 half">
                        <div class="input-group">
                            <input type="password" id="Password2" name="Password" 

                            	class="form-control dark validate[required,minSize[4],maxSize[255]]" 
                            	placeholder="Password"/>
                        </div>
                        <div class="space-line"></div>
                    </div>
                    <div class="col-xs-6 half">
                        <div class="input-group password-control">
                            <input type="password" class="form-control dark validate[required,equals[Password2]]" placeholder="Confirm"/>
                        </div>
                        <div class="space-line"></div>
                    </div>
                </div>
                <div class="row half">
                    <div class="col-xs-6 half">
                        
                    </div>

                    <div class="col-xs-6 half">
                        <button class="btn btn-default btn-block" type="button" onclick="updateAccount2()">UPDATE</button>
                    </div>
                </div>
            </form>
            </div>
        </div>
    </div>
</div>
    <script type="text/javascript">
        $(document).ready(function(){
            if($('#infoForm').length==1)
                $('#infoForm').validationEngine({
                    'scroll': false
                    , 
                    'isPopup' : false
                    , 
                    prettySelect : true
                //, validateNonVisibleFields:false
                });
        	if($('#updForm').length==1)
                $('#updForm').validationEngine({
                    'scroll': false
                    , 
                    'isPopup' : false
                    , 
                    prettySelect : true
                //, validateNonVisibleFields:false
                });
        });
        function confirmCheckout(){
            if( $('#infoForm').validationEngine('validate') === false)return;
            dialog('confirmCheckout');
        }
        function updateAccount2(){
        	if( $('#updForm').validationEngine('validate') === false)return;
            var params = $('#updForm').serializeObject();
            httpRequest({
                'url': '/frontend/account/onUpdate2',
                'data': {
                    'params' : params
                },
                'callback': function(rsdata) {
                    if (rsdata.result < 0) {
                        dialogMsg(rsdata.message);
                    } else {
                        dialogMsg(rsdata.message);
                        window.location.reload();
                    }
                }
            }).call();
        }
        function updateAccount(){
            if( $('#infoForm').validationEngine('validate') === false)return;
            var params = $('#infoForm').serializeObject();
            httpRequest({
                'url': '/frontend/account/onUpdate',
                'data': {
                    'params' : {
                    	data : params
                    }
                },
                'callback': function(rsdata) {
                    if (rsdata.result < 0) {
                        dialogMsg(rsdata.message);
                    } else {
                        dialogMsg(rsdata.message);
                    }
                }
            }).call();
        }
    </script>
    [{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/foot.tpl"}]