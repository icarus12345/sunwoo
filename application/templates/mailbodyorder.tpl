<table border="1">
    <tr>
        <th colspan="2">Order Information</th>
    </tr>
    <tr>
        <td>Name:</td>
        <td>[{$params._name}]</td>
    </tr>
    <tr>
        <td>Phone:</td>
        <td>[{$params._phone}]</td>
    </tr>
    <tr>
        <td>Email:</td>
        <td>[{$params._email}]</td>
    </tr>
    <tr>
        <td style="vertical-align: top;">Content:</td>
        <td><pre style="font:inherit;">[{$params._note}]</pre></td>
    </tr>
</table>

<table class="table table-bordered" style="width:100%" border="1">
    <tr>
        <th colspan="2">Product Item</th>
        <th width="120" style="text-align: right;">Price</th>
        <th width="120">Quanlity</th>
        <th width="120" style="text-align: right;">Total</th>
    </tr>
    [{foreach from=$smarty.session.cart.items item=item}]
        [{foreach from=$item item=foo key=color}]
        <tr title="[{$foo->_title}]">
            <td width="60">
                <img src="[{$foo->_image}]" class="lazy" width="60">
            </td>
            <td>
                <div >[{$foo->_code}]</div>
                <div >[{$foo->_title}]</div>
                [{if $foo->color}]<div>Color : [{$foo->color->_title}]</div>[{/if}]
                [{if $foo->size}]<div>Size : [{$foo->size->_title}]</div>[{/if}]
                [{if $foo->materia}]<div>Materia : [{$foo->materia->_title}]</div>[{/if}]
            </td>
            <td style="text-align: right;">
                 <div>[{$foo->sale_price|string_format:"%.2f"}]K</div>
                
                
            </td>
            <td>
                [{$foo->quantity}]
            </td>
            <td style="text-align: right;">
                <div><span class="price">[{($foo->sale_price * $foo->quantity)|string_format:"%.2f"}]</span> K</div>
            </td>
        </tr>
        [{/foreach}]
    [{/foreach}]
    <tr>
        <td colspan="5" style="text-align: right;">
            Total <span class="total">[{$smarty.session.cart.info.cash|default:'0.00'}]</span> K
        </td>
    </tr>
</table>