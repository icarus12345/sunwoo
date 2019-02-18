<div style="cursor:pointer" data-toggle="dropdown">
    $ [{$smarty.session.cart.info.cash|default:'0.00'}] <span class="c-white">([{$smarty.session.cart.info.amount|default:'0'}] items)</span> 
    <img style="margin-top: -4px" height="12px" src="/assets/scooter/images/cart.png"/>
</div>
<div class="cart-items dropdown-menu" >
    	<table style="width:100%">
		    [{foreach from=$smarty.session.cart.items item=item}]
		    [{foreach from=$item item=foo key=color}]
    		<tr>
    			<td width="80">
    				<div class="nailthumb">
                        <div class="nailthumb-figure-square">
                            <div class="nailthumb-container">
                                <img data-original="[{$foo->product_thumb}]" class="lazy">
                            </div>
                        </div>
                    </div>
    			</td>
    			<td>
    				[{$foo->product_title}]<br/>
    				[{if $color}]Color : [{$color}]<br/>[{/if}]
    				$ [{$foo->product_price|string_format:"%.2f"}] x [{$foo->quantity}]
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