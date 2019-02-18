<input type="hidden" name="product_token" id="product_token"
value="[{$item->product_token|default:$token|default:''}]"/>
<div class="pull-bottom pull-top">
    <span class="code cursor"
        title="Add new Photo"
        onclick="productopt.onAddItem()">
        <i class="fa-plus"></i>&nbsp;Add Option
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
            <th>Desc</th>
            <th>Value</th>
        </tr>
    </thead>
<tbody></tbody>
</table>
[{assign var=data value=$item->product_data|json_decode:'true'}]