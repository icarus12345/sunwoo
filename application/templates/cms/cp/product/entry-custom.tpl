<input type="hidden" name="_data[]" value="">
<div data-custombox=1>
    [{foreach from=$head_data item=head}]
        <fieldset>
            <legend>[{$head->_title}]</legend>
            <div>

                [{foreach from=$line_data item=line}]
                    [{if $head->_id == $line->_head_id}]
                        <div data-headid="[{$line->_category_id}]">
                            <label class="cb" > 
                                <input  
                                    type="checkbox"
                                    name="_data[[{$head->_id}]][]"
                                    value="[{$line->_id}]"
                                    [{if $line->_id|in_array:$item->_data[$head->_id]}]checked[{/if}]
                                    >
                                <span></span>
                                [{$line->_title}]
                            </label>
                        </div>
                    [{/if}]
                [{/foreach}]
            </div>
        </fieldset>
    [{/foreach}]
</div>
