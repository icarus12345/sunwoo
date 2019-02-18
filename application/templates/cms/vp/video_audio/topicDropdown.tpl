<select 
    name="video_topic" 
    class="form-control selectpicker"
    data-live-search="true"
    data-size="10"
    >
    <option value="">Nothing Selected</option>
    [{if $topics|default:null}]
    [{foreach from=$topics item=a}]
        [{if $a[0]->author_name|default:'' !=''}]
        <optgroup label="Author: [{$a[0]->author_name|default:''|escape:'html'}]">
        [{/if}]
        [{foreach from=$a item=o}]

        <option
            [{if $o->topic_id == $item->video_topic}]selected="1"[{/if}]
            value="[{$o->topic_id|default:''}]">
                [{$o->topic_title|default:''|escape:'html'}]
        </option>
        [{/foreach}]
        [{if $a[0]->author_name|default:'' !=''}]
        </optgroup>
        [{/if}]
    [{/foreach}]
    [{/if}]
</select>