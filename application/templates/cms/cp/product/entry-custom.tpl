<input type="hidden" name="_data[nothing]" value="">
<div data-custombox=1>
        <table style="width: 100%">
            <tr>
                <td>Customize</td>
                <td width="100">Price incurred</td>
            </tr>
        </table>
    [{foreach from=$head_data item=head}]
        <fieldset>
            <legend>[{$head->_title}]</legend>
            <div>

                [{foreach from=$line_data item=line}]
                    [{if $head->_id == $line->_head_id}]
                        <div data-headid="[{$line->_category_id}]">
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <label class="cb" style="width: auto;"> 
                                            <input  
                                                type="checkbox"
                                                name="_data[custom][[{$head->_id}]][]"
                                                value="[{$line->_id}]"
                                                [{if $line->_id|in_array:$item->_data.custom[$head->_id]}]checked[{/if}]
                                                >
                                            <span></span>
                                            [{$line->_title}]
                                        </label>
                                        [{if $head->_id == 3}]
                                        <a 
                                            class="label label-info" 
                                            data-toggle="collapse" 
                                            href="#collapse-[{$line->_id}]" 
                                            aria-expanded="false" 
                                            aria-controls="collapse-[{$line->_id}]">Custom Photo</a>
                                        [{/if}]
                                    </td>
                                    <td width="100">
                                        <div class="control-group pull-right">
                                            <!-- <div>Price incurred:</div> -->
                                            <div class="input-append input-append-sm">
                                                <input type="text" 
                                                    class="form-control text-right validate[required,custom[number]]"
                                                    name="_data[price_incurred][[{$line->_id}]]" 
                                                    value="[{$item->_data.price_incurred[$line->_id]|escape|default:'0'}]"/>
                                                <span class="add-on" title="Unit 1000">
                                                    K
                                                </span>
                                            </div>

                                        </div>

                                    </td>
                                </tr>
                                [{if $head->_id == 3}]
                                <tr>
                                    <td colspan="2">
                                        <div class="collapse collapse-photo" id="collapse-[{$line->_id}]">
                                          <div class="well">
                                            <ul id="sortable-[{$line->_id}]" data-role="sortable" class="sortable" style="min-height: 100px" data-prefix="_data[images][[{$line->_id}]][]">
                                                <li class="ui-state-default ui-state-dashed" onclick="App.PhotoBook.add('#sortable-[{$line->_id}]')">
                                                        <i class="fa fa-plus"></i>
                                                </li>
                                                [{if $item->_data}]
                                                    [{foreach from=$item->_data.images[$line->_id] item=img}]
                                                        <li class="ui-state-default">
                                                            <img class="thumb" src="[{$img|escape}]"/>
                                                            <div class="action cursor" onclick="App.PhotoBook.delete(this)">
                                                                <i class="fa fa-trash-alt"></i>
                                                            </div>
                                                            <input type="hidden" name="_data[images][[{$line->_id}]][]" value="[{$img|escape}]">
                                                        </li>
                                                    [{/foreach}]
                                                [{/if}]
                                            </ul>
                                            <div class="clearfix"></div>
                                          </div>
                                        </div>
                                    </td>
                                </tr>

                                [{/if}]
                            </table>
                        </div>
                    [{/if}]
                [{/foreach}]
            </div>
        </fieldset>
    [{/foreach}]
</div>
