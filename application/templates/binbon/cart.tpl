[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/meta.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/nav.tpl"}]

<div class="wrap">
    <ol class="breadcrumb">
      <li><a href="/">[{$languages.default.home|escape}]</a></li>
      <li class="active">[{$languages.default.my_bag|escape}]</li>
    </ol>
    <div>
        
            <h3>[{$languages.default.my_bag|escape}]</h3>
            <table class="table table-striped" style="width:100%">
                <tr>
                    <th colspan="3">Product Item</th>
                    <th width="120" class="text-right">Price</th>
                    <th width="120">Quanlity</th>
                    <th width="120" class="text-right">Total</th>
                </tr>
                [{foreach from=$smarty.session.cart.items item=item}]
                    [{foreach from=$item item=foo key=color}]
                    <tr title="[{$foo->_title}]" 
                        data-pid="[{$foo->_id}]" 
                        data-color="[{$foo->color->_id|default:''}]" 
                        data-size="[{$foo->size->_id|default:''}]"
                        data-materia="[{$foo->materia->_id|default:''}]"
                        >
                        <td width="20">
                            <a href="Javascript:" class="fa fa-close"></a>
                        </td>
                        <td width="60">
                                        <img src="[{$foo->_image}]" class="lazy" width="60">
                        </td>
                        <td>
                            <div >[{$foo->_code}]</div>
                            <div >[{$foo->_title}]</div>
                            [{if $foo->color}]<div>[{$languages.default.color|escape}] : [{$foo->color->_title}]</div>[{/if}]
                            [{if $foo->size}]<div>[{$languages.default.size|escape}] : [{$foo->size->_title}]</div>[{/if}]
                            [{if $foo->materia}]<div>[{$languages.default.materia|escape}] : [{$foo->materia->_title}]</div>[{/if}]
                        </td>
                        <td class="text-right">
                             <div>[{$foo->sale_price}]K</div>
                            
                            
                        </td>
                        <td>
                            <div class="input-group snippet">
                              <span class="input-group-btn">
                                  <button type="button" class="btn btn-default btn-number" data-type="minus">
                                      <span class="fa fa-angle-left"></span>
                                  </button>
                              </span>
                              <input type="text" name="quantity" class="form-control input-number" value="[{$foo->quantity}]" min="1" max="10">
                              <span class="input-group-btn">
                                  <button type="button" class="btn btn-default btn-number" data-type="plus">
                                      <span class="fa fa-angle-right"></span>
                                  </button>
                              </span>
                            </div>
                        </td>
                        <td class="text-right">
                            <div><span class="item-cash">[{($foo->sale_price * $foo->quantity)}]</span> K</div>
                        </td>
                    </tr>
                    [{/foreach}]
                [{foreachelse}]
                    <tr>
                        <td colspan="6">
                            <div class="text-center" style="padding: 40px 0">No items.</div>
                        </td>
                    </tr>
                [{/foreach}]
                <tr>
                    <td colspan="6" class="text-right">
                        Total <span class="total">[{$smarty.session.cart.info.cash|default:'0'}]</span> K
                    </td>
                </tr>
            </table>
        <form id="orderForm" name="orderForm" >
            <div class="form">
                <h2>[{$languages.default.information_order|escape}]</h2>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                        <label for="exampleInputEmail1">[{$languages.default.full_name|escape}]</label>
                        <input type="text" class="form-control validate[required]" name="_name" placeholder="">
                        </div>
                        <div class="form-group">
                        <label for="exampleInputPassword1">[{$languages.default.phone|escape}]</label>
                        <input type="text" class="form-control validate[required]" name="_phone" placeholder="">
                        </div>
                        <div class="form-group">
                        <label for="exampleInputPassword1">Email</label>
                        <input type="email" class="form-control validate[required,custom[email]]" name="_email" placeholder="">
                        </div>
                        <br/>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                        <label for="exampleInputPassword1">[{$languages.default.content|escape}]</label>
                        <textarea rows="8" class="form-control validate[required]" name="_note" placeholder=""></textarea>
                        </div>
                        <br/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group-" >
                            <a href="/shop" class="btn btn-default btn-sm btn-block btn-info" >[{$languages.default.continue_shopping|escape}]</a>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group-" id="out-message">
                            <button type="button" class="btn btn-default btn-sm btn-block btn-info" onclick="send()">[{$languages.default.confirm_order|escape}]</button>
                        </div>
                    </div>
                </div>
                <br/>
                <br/>
                <br/>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
  $(document).ready(function(){

    $('#orderForm').validationEngine({
      'scroll': false, 
      'isPopup' : false, 
      prettySelect : true
    //, validateNonVisibleFields:false
    });
    $('tr[data-pid] input').blur(function(){
        var tr = $(this).parents('tr[data-pid]');
        var pid = tr.data('pid');
        var color = tr.data('color');
        var size = tr.data('size');
        var materia = tr.data('materia');
        var num = tr.find('input[name="quantity"]').val();
        console.log(num)
        App.onUpdateItem({
            id:pid,
            color:color,
            size:size,
            materia:materia,
            quantity:num,
        },function(res){
            $('.total').html(res.data.info.cash)
            tr.find('.item-cash').html(res.data.items[pid][color+'-'+size+'-'+materia].cash)
        })
    })
    $('tr[data-pid] .snippet button').click(function(){
        var tr = $(this).parents('tr[data-pid]');
        var pid = tr.data('pid');
        var color = tr.data('color');
        var size = tr.data('size');
        var materia = tr.data('materia');
        var num = tr.find('input[name="quantity"]').val();
        console.log(num)
        App.onUpdateItem({
            id:pid,
            color:color,
            size:size,
            materia:materia,
            quantity:num,
        },function(res){
            $('.total').html(res.data.info.cash)
            tr.find('.item-cash').html(res.data.items[pid][color+'-'+size+'-'+materia].cash)
        })
    })
    $('tr[data-pid]').on('click','.fa.fa-close',function(){
        var tr = $(this).parents('tr[data-pid]');
        var pid = tr.data('pid');
        var color = tr.data('color');
        var size = tr.data('size');
        var materia = tr.data('materia');
        console.log(this)
        App.onRemoveItem({
            id:pid,
            color:color,
            size:size,
            materia:materia,
        },function(res){
            tr.remove();
            $('.total').html(res.data.info.cash)
        })
    })
  })
  function send(){
    if( $('#orderForm').validationEngine('validate') === false)return;
    var params = $('#orderForm').serializeObject();
    $('#out-message').hide();
    $.post('/frontend/cart/onckeckout',
      {
        params : params
      },function(rsdata) {
        $('#out-message').show();

        if (rsdata.result < 0) {
        } else {
          document.orderForm.reset();
          $('#out-message').html('<h2>'+rsdata.message+'</h2>')
        }
      })
    return false;
  }
</script>

[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/foot.tpl"}]
