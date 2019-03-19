<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab" onclick="app.switch_search('rent')">Cho thuê</a></li>
<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" onclick="app.switch_search('selling')">Bán</a></li>
<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab" onclick="app.switch_search('project')">Dự án</a></li>
<li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab" onclick="app.switch_search('invest')">Ðầu tư</a></li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
<div role="tabpanel" class="tab-pane active">
    <form id="searchFrm" method="get" action="/rent">
        <div class="pull-bottom">
            <div class="input-group search-input">
              <input type="text" class="form-control" placeholder="Từ khóa tìm kiếm..." name="keyword">
              <span class="input-group-btn">
                <button class="btn btn-default" type="submit" id="btn-search">Tìm kiếm</button>
              </span>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-sm-6 pull-bottom">
                <select class="form-control selectpicker" name="category">
                    <option value="">[--Chọn loại hình--]</option>
                    [{foreach $categories as $cat}]
                        <option value="[{$cat->cat_id}]">[{$cat->cat_title}]</option>
                    [{/foreach}]
                </select>

            </div>
            <div class="col-md-3 col-sm-6 pull-bottom">
                <select name="acreage" class="form-control selectpicker" placeholder="Chọn diện tích">
                    <option value="">[--Chọn diện tích--]</option>
                    [{foreach $acreages as $item}]
                        <option value="[{$item->_id}]">[{$item->_title}]</option>
                    [{/foreach}]
                </select>
                <!-- <input id="dt" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="5" data-slider-value="[250,450]"/> -->
            </div>
            <div class="col-md-3 col-sm-6 pull-bottom">
                <select class="form-control selectpicker" name="price">
                    <option value="">[--Chọn bảng giá--]</option>
                    [{foreach $prices as $item}]
                        <option value="[{$item->_id}]">[{$item->_title}]</option>
                    [{/foreach}]
                </select>

            </div>
        </div>
        <div><i class="toggle-search-advance a" onclick="app.toggleSearchAdvance()">Tìm kiếm nâng cao</i></div>
        <div class="search-advance">
            <div class="row">
                <div class="col-md-3 col-sm-6 pull-top">
                    <input type="number" name="floor" class="form-control" placeholder="[--Chọn số tầng--]">

                </div>
                <div class="col-md-3 col-sm-6  pull-top">
                    <input type="number" name="badroom" class="form-control" placeholder="[--Chọn số phòng ngủ--]">

                </div>
                <div class="col-md-3 col-sm-6  pull-top">
                    <input type="number" name="bathroom" class="form-control" placeholder="[--Chọn số phòng tắm--]">
                </div>
                <div class="col-md-3 col-sm-6  pull-top">
                    <select class="form-control selectpicker" multiple="" title="[--Chọn tiện ích đi kèm--]">
                        [{foreach $utilities as $item}]
                            <option value="[{$item->_id}]">[{$item->_title}]</option>
                        [{/foreach}]
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 col-sm-6  pull-top">
                    <select class="form-control selectpicker" id="province-cbx" data-size="10" name="province" data-live-search="true">
                        <option value="">[--Chọn Tỉnh/Thành Phố--]</option>
                    </select>

                </div>
                <div class="col-md-3 col-sm-6  pull-top">
                    <select class="form-control selectpicker" id="district-cbx" data-size="10" name="district" data-live-search="true">
                        <option value="">[--Chọn Quận/Huyện--]</option>
                    </select>

                </div>
                <div class="col-md-3 col-sm-6  pull-top">
                    <select class="form-control selectpicker" id="ward-cbx" data-size="10" name="ward" data-live-search="true">
                        <option value="">[--Chọn Xã/Phường--]</option>
                    </select>

                </div>
                <div class="col-md-3 col-sm-6  pull-top">
                    <select class="form-control selectpicker">
                        <option value="">[--Chọn hướng--]</option>
                    </select>

                </div>
            </div>
        </div>
    </form>
</div>
</div>