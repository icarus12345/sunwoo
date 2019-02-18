
<div>
    [{assign var=product_features value=','|explode:$item->product_features}]
    [{foreach from=$head_data item=head}]
        <fieldset>
            <legend>[{$head->_title_vi}]</legend>
            <div>

                [{foreach from=$line_data item=line}]
                    [{if $head->_id == $line->_head_id}]
                        <div class="form-check">
                            <input 
                                class="form-check-input" 
                                type="checkbox" 
                                id="_features_[{$line->_id}]" 
                                name="product_features"
                                value="[{$line->_id}]"
                                [{if $line->_id|in_array:$product_features}]checked[{/if}]
                                >
                                
                            <label class="form-check-label" for="_features_[{$line->_id}]">
                                [{$line->_title_vi}]
                            </label>
                        </div>
                    [{/if}]
                [{/foreach}]
            </div>
        </fieldset>
    [{/foreach}]
</div>
