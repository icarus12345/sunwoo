<!-- Nav tabs -->
<script type="text/javascript">
    $(document).ready(function(){
        setTimeout(function(){

            $('#tab-search-box .tab-[{$cate_detail->cat_id}] a').click();
        },300)
    })
</script>
<ul class="nav nav-tabs" role="tablist" id="tab-search-box">
    <li role="presentation" class="tab-415 active">
        <a href="#home" aria-controls="home" role="tab" data-toggle="tab" onclick="app.switch_search('rent')">
            [{$languages.all_rent|quotes_to_entities}]
        </a>
    </li>
    <li role="presentation" class="tab-414">
        <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" onclick="app.switch_search('selling')">[{$languages.all_selling|quotes_to_entities}]</a>
    </li>
    <li role="presentation" class="tab-416"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab" onclick="app.switch_search('project')">[{$languages.all_project|quotes_to_entities}]</a></li>
    <li role="presentation" class="tab-413"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab" onclick="app.switch_search('invest')">[{$languages.all_invest|quotes_to_entities}]</a></li>
</ul>
<!-- Tab panes -->
<div class="tab-content">
<div role="tabpanel" class="tab-pane active">
    <form id="searchFrm" method="get" action="/rent">
        <div class="pull-bottom">
            <div class="input-group search-input">
              <input type="text" class="form-control" placeholder="[{$languages.all_search_keyword|quotes_to_entities}]" name="keyword" value="[{$smarty.get.keyword}]">
              <span class="input-group-btn">
                <button class="btn btn-default" type="submit" id="btn-search">[{$languages.all_search|quotes_to_entities}]</button>
              </span>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-sm-6 pull-bottom">
                <select class="form-control selectpicker" name="category">
                    <option value="">[--[{$languages.all_select_the_category|quotes_to_entities}]--]</option>
                    [{foreach $categories as $cat}]
                        <option value="[{$cat->cat_id}]" [{if $smarty.get.category == $cat->cat_id}]selected[{/if}]>[{$cat->cat_title}]</option>
                    [{/foreach}]
                </select>

            </div>
            <div class="col-md-3 col-sm-6 pull-bottom">
                <select name="acreage" class="form-control selectpicker" placeholder="Chọn diện tích">
                    <option value="">[--[{$languages.all_select_the_acreage|quotes_to_entities}]--]</option>
                    [{foreach $acreages as $item}]
                        <option value="[{$item->_id}]" [{if $smarty.get.acreage == $item->_id}]selected[{/if}]>[{$item->_title}]</option>
                    [{/foreach}]
                </select>
                <!-- <input id="dt" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="5" data-slider-value="[250,450]"/> -->
            </div>
            <div class="col-md-3 col-sm-6 pull-bottom">
                <select class="form-control selectpicker" name="price">
                    <option value="">[--[{$languages.all_select_the_price|quotes_to_entities}]--]</option>
                    [{foreach $prices as $item}]
                        <option value="[{$item->_id}]" [{if $smarty.get.price == $item->_id}]selected[{/if}]>[{$item->_title}]</option>
                    [{/foreach}]
                </select>

            </div>
        </div>
        <div><i class="toggle-search-advance a" onclick="app.toggleSearchAdvance()">[{$languages.all_advanced_search|quotes_to_entities}]</i></div>
        <div class="search-advance">
            <div class="row">
                <div class="col-md-3 col-sm-6 pull-top">
                    <input type="number" name="floor" class="form-control" placeholder="[--[{$languages.all_floor|quotes_to_entities}]--]" value="[{$smarty.get.floor}]">

                </div>
                <div class="col-md-3 col-sm-6  pull-top">
                    <input type="number" name="bedroom" class="form-control" placeholder="[--[{$languages.all_bedroom|quotes_to_entities}]--]" value="[{$smarty.get.bedroom}]">

                </div>
                <div class="col-md-3 col-sm-6  pull-top">
                    <input type="number" name="bathroom" class="form-control" placeholder="[--[{$languages.all_bathroom|quotes_to_entities}]--]" value="[{$smarty.get.bathroom}]">
                </div>
                <div class="col-md-3 col-sm-6  pull-top">
                    <select class="form-control selectpicker" multiple="" title="[--[{$languages.all_select_the_utilities|quotes_to_entities}]--]" name="utilities[]">
                        [{foreach $utilities as $item}]
                            <option value="[{$item->_id}]" [{if $item->_id|in_array:$smarty.get.utilities}]selected[{/if}]>[{$item->_title}]</option>
                        [{/foreach}]
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 col-sm-6  pull-top">
                    <select class="form-control selectpicker" id="province-cbx" data-size="10" name="province" data-live-search="true">
                        <option value="">[--[{$languages.all_select_the_province|quotes_to_entities}]--]</option>
                    </select>

                </div>
                <div class="col-md-3 col-sm-6  pull-top">
                    <select class="form-control selectpicker" id="district-cbx" data-size="10" name="district" data-live-search="true">
                        <option value="">[--[{$languages.all_select_the_district|quotes_to_entities}]--]</option>
                    </select>

                </div>
                <div class="col-md-3 col-sm-6  pull-top">
                    <select class="form-control selectpicker" id="ward-cbx" data-size="10" name="ward" data-live-search="true">
                        <option value="">[--[{$languages.all_select_the_ward|quotes_to_entities}]--]</option>
                    </select>

                </div>
                <div class="col-md-3 col-sm-6  pull-top">
                    <select class="form-control selectpicker">
                        <option value="">[--[{$languages.all_select_the_direction|quotes_to_entities}]--]</option>
                    </select>

                </div>
            </div>
        </div>
    </form>
</div>
</div>