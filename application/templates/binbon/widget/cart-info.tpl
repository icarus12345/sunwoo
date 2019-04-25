<div class="dropdown">
    <div style="cursor:pointer" data-toggle="dropdown">
        $ [{$smarty.session.cart.info.cash|default:'0.00'}] <span class="c-white">([{$smarty.session.cart.info.amount|default:'0'}] items)</span> 
        <img style="margin-top: -4px" height="12px" src="/assets/binbon/images/cart.png"/>
    </div>
    <div class="cart-items dropdown-menu" >
            <table style="width:100%" border="1">
                [{foreach from=$smarty.session.cart.items item=item}]
                    [{foreach from=$item item=foo key=color}]
                    <tr title="[{$foo->_title}]">
                        <td width="60">
                            <div class="nailthumb">
                                <div class="nailthumb-figure-square">
                                    <div class="nailthumb-container cover" style="background-image: url('[{$foo->_image}]')">
                                        <img data-original="[{$foo->_image}]" class="lazy">
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div >[{$foo->_code}]</div>
                            [{if $foo->color}]<div>Color : [{$foo->color->_title}]</div>[{/if}]
                            [{if $foo->size}]<div>Size : [{$foo->size->_title}]</div>[{/if}]
                            [{if $foo->materia}]<div>Materia : [{$foo->materia->_title}]</div>[{/if}]
                            <div>$ [{$foo->sale_price|string_format:"%.2f"}] x [{$foo->quantity}]</div>
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
                <tr>
                    <td colspan="2">
                        <center><a href="/cart"><span class="c-white">Your cart</span></a></center>
                    </td>
                </tr>
            </table>
    </div>
</div>
