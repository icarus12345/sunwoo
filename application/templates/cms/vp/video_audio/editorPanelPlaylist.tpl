<input 
    type="hidden" 
    value="[{$item->playlist_id|default:''}]" 
    id="EntryId"
    />

<form name="entryForm" id="entryForm" target="integration_asynchronous">
    <div class="control-group pull-top">
        <div>Title :</div>
        <input type="text" 
            class="form-control validate[required,maxSize[255]]"
            value="[{$item->playlist_title|escape:'html'|default:''}]" 
            name="playlist_title"
            >

    </div>
    <span class="squaredThree">
        <input type="checkbox" id="squaredThreePlaylistStatus" [{if $item->playlist_status=='true'}]checked[{/if}]>
        <label for="squaredThreePlaylistStatus"></label>
    </span>
    <label for="squaredThreePlaylistStatus">Status</label>
    <div class="clearfix"></div>
</form>