[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            [{if $item}]
            <h4>Customer</h4>
            [{else}]
            <h4>Customer</h4>
            [{/if}]
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="[{$item->order_id|default:''}]" 
                id="EntryId"
                />
                <form name="entryForm" id="entryForm" target="integration_asynchronous">
                    <div class="col-mb-4 half">
                        <div class="control-group pull-top">
                            <div>Status :</div>
                            <select name="order_status" class="form-control selectpicker">
                                <option value="New" [{if ($item->order_status|default:'New')=='New'}]selected[{/if}]>New</option>
                                <option value="Shipping" [{if ($item->order_status|default:'New')=='Shipping'}]selected[{/if}]>Shipping</option>
                                <option value="Delivery" [{if ($item->order_status|default:'New')=='Delivery'}]selected[{/if}]>Delivery</option>
                                <option value="Cancel" [{if ($item->order_status|default:'New')=='Cancel'}]selected[{/if}]>Cancel</option>
                            </select>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </form>
                    [{assign var="odata" value=$item->order_data|json_decode:true}]
                    <table class="table">
                        <tr>
                            <td colspan="5">
                                ORDER ID : [{$item->order_id}]
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                Created : [{$item->order_insert}]<br/>
                                TOTAL : $ [{$item->order_total}]
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
        </div>
    </div>
</div>
<ul class="round-buttons round-fixed f-second">
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()">
                <i class="fa fa-save fa"></i>
            </a>
        </div>
    </li>
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()">
                <i class="fa fa-reply-all"></i>
            </a>
        </div>
    </li>
</ul>
[{/nocache}]