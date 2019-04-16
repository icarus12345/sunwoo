<input type="hidden" name="product_token" id="product_token"
value="[{$item->product_token|default:$token|default:''}]"/>
<div class="pull-bottom pull-top">
    <span class="code cursor"
        title="Add new Photo"
        onclick="productopt.onAddItem()">
        <i class="fa fa-plus"></i>&nbsp;Add Option
    </span>
    &nbsp;&nbsp;
    <span class="code cursor"
        title="Delete all"
        onclick="productopt.deleteAll()">
        <i class="fa fa-trash-o"></i>&nbsp;Delete all
    </span>
</div>
<table id="entryOptDatatable" class="table table-bordered table-striped message-table" style="width: 100%">
    <thead>
        <tr>
            <th><span class="fa fa-key"></span></th>
            <th><span class="fa fa-circle-thin"></span></th>
            <th>Name</th>
            <th>Price</th>
            <th>Amount</th>
            <th>Color</th>
            <th>Size</th>
        </tr>
    </thead>
<tbody></tbody>
</table>
[{assign var=data value=$item->product_data|json_decode:'true'}]
<!-- <div class="space-line" style="height:10px;"></div>
<table class="calendar colors">
    <tr>
        <td class="title-cell" colspan="4" style="padding: 5px;background: #ebebeb;">
            COLOR
            <span class="code cursor pull-right"
                title="Add new Color"
                onclick="addColors()">
                <i class="fa fa-plus"></i>&nbsp;Add
            </span>
        </td>
    </tr>
    [{if $data.color|count ==0}]
    <tr>
        [{for $row=0 to 3}]
        <td><input type="text" value="" class="i-v"></td>
        [{/for}]
    </tr>
    [{/if}]
    [{for $foo=0 to $data.color|count -1 step=4}]
    <tr>
        [{for $row=0 to 3}]
        <td><input type="text" value="[{$data.color[$foo+$row]}]" class="i-v"></td>
        [{/for}]
    </tr>
    [{/for}]
    <tr class="last" style="display:none">
        <td colspan="8" class="title-cell">
            
        </td>
    </tr>
</table>
<div class="space-line" style="height:10px;"></div> -->
<!-- <div class="properties">
    [{foreach from=$data item=pro key=name}]
        [{if $name != 'color'}]
        <table class="calendar">
            <tr>
                <td colspan="4"><input type="text" value="[{$name}]" class="text-center i-n" placeholder="Option Name"></td>
            </tr>
            [{for $foo=0 to $data[$name]|count -1 step=4}]
            <tr>
                [{for $row=0 to 3}]
                <td><input type="text" value="[{$data[$name][$foo+$row]}]" class="i-v"></td>
                [{/for}]
            </tr>
            [{/for}]
            <tr class="last">
                <td colspan="8" class="title-cell">
                    <button type="button" class="btn btn-default" onclick="addPropetyItem(this)">ADD</button>
                </td>
            </tr>
        </table>
        
        [{/if}]
    [{/foreach}]
</div>
<button type="button" class="btn btn-default" onclick="addProperty()">Add New Property</button> -->
<script type="text/javascript">
    // $('.colors .colorpicker').colorpicker();
    function addColors(){
        $('table.colors .last').before('<tr>\
            <td><input type="text" class="i-v"></td>\
            <td><input type="text" class="i-v"></td>\
            <td><input type="text" class="i-v"></td>\
            <td><input type="text" class="i-v"></td>\
        </tr>');
        // $('.colors .colorpicker').colorpicker();
    }
    function addProperty(){
        $('.properties').append('<table class="calendar">\
            <tr>\
                <td colspan="4"><input type="text" value="" class="text-center i-n" placeholder="Option Name"></td>\
            </tr>\
            <tr>\
                <td><input class="i-v" type="text" value=""></td>\
                <td><input class="i-v" type="text" value=""></td>\
                <td><input class="i-v" type="text" value=""></td>\
                <td><input class="i-v" type="text" value=""></td>\
            </tr>\
            <tr>\
                <td><input class="i-v" type="text" value=""></td>\
                <td><input class="i-v" type="text" value=""></td>\
                <td><input class="i-v" type="text" value=""></td>\
                <td><input class="i-v" type="text" value=""></td>\
            </tr>\
            <tr class="last">\
                <td colspan="8" class="title-cell">\
                    <button type="button" class="btn btn-default" onclick="addPropetyItem(this)">ADD</button>\
                </td>\
            </tr>\
        </table><div class="space-line" style="height:10px;"></div>');
    }
    function addPropetyItem(elm){
        $(elm).parents('tr.last').before('<tr>\
            <td><input type="text" class="i-v"></td>\
            <td><input type="text" class="i-v"></td>\
            <td><input type="text" class="i-v"></td>\
            <td><input type="text" class="i-v"></td>\
        </tr>');
    }
    function cleanArray(actual){
      var newArray = new Array();
      for(var i = 0; i<actual.length; i++){
          if (actual[i]){
            newArray.push(actual[i]);
        }
      }
      return newArray;
    }
    function getProperties(){
        var color = $('.colors .i-v').map(function(){return this.value});
        var properties = $('.properties .calendar').map(function(){
            var name = $(this).find('.i-n').val();
            var values = $(this).find('.i-v').map(function(){
                return this.value;
            });
            return {name:name,values:values.get()}
        });
        var data = {};
        data['color'] = cleanArray($('.colors .i-v').map(function(){return this.value}).get());
        for(var i = 0; i < properties.length ; i++){
            if(properties[i].name){
                if(data[properties[i].name])
                    data[properties[i].name].push(cleanArray(properties[i].values));
                else
                    data[properties[i].name] = cleanArray(properties[i].values);
                
            }
        }
        return data;
    }
</script>
<style type="text/css">
    .calendar{
        border: 1px solid #ddd;
        width: 100%;
    }
    .calendar td{ 
        border: 1px solid #ddd;text-align: center;
        
    }
    
    .calendar td.title-cell{padding: 10px;}
    .calendar td input{
        border: 0;width: 100%;
        line-height: 30px;
        padding: 0 10px;
    }
</style>