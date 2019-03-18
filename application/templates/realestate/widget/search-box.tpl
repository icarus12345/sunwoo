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
    <div class="pull-bottom">
        <div class="input-group search-input">
          <input type="text" class="form-control" placeholder="Từ khóa tìm kiếm..." name="keyword">
          <span class="input-group-btn">
            <a class="btn btn-default" type="button" id="btn-search" href="/rent">Tìm kiếm</a>
          </span>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-sm-6 pull-bottom">
            <select class="form-control selectpicker" name="category">
                <option>[--Chọn loại hình--]</option>
                [{foreach $categories as $cat}]
                    <option value="[{$cat->id}]">[{$cat->cat_title}]</option>
                [{/foreach}]
            </select>

        </div>
        <div class="col-md-3 col-sm-6 pull-bottom">
            <select name="acreage" class="form-control selectpicker" placeholder="Chọn diện tích">
                <option value="">[--Chọn diện tích--]</option>
                <option value="1">Dưới 50m2</option>
                <option value="2">Từ 50m2-100m2</option>
                <option value="3">Từ 100m2-150m2</option>
                <option value="4">Trên 150m2</option>
            </select>
            <!-- <input id="dt" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="5" data-slider-value="[250,450]"/> -->
        </div>
        <div class="col-md-3 col-sm-6 pull-bottom">
            <select class="form-control selectpicker" name="price">
                <option value="">[--Chọn bảng giá--]</option>
                <option value="1">Dưới 1 Tỷ</option>
                <option value="2">Từ 1 - 2 Tỷ</option>
                <option value="3">Từ 2 - 3 Tỷ</option>
                <option value="4">Trên 3 Tỷ</option>
            </select>

        </div>
    </div>
    <div><i class="toggle-search-advance a" onclick="app.toggleSearchAdvance()">Tìm kiếm nâng cao</i></div>
    <div class="search-advance">
        <div class="row">
            <div class="col-md-3 col-sm-6 pull-top">
                <select class="form-control selectpicker" name="floor">
                    <option value="">[--Chọn Số tầng--]</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value=">3">Nhiều</option>
                </select>

            </div>
            <div class="col-md-3 col-sm-6  pull-top">
                <select class="form-control selectpicker" name="badroom">
                    <option value="">[--Chọn số phòng ngủ--]</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value=">3">Nhiều</option>
                </select>

            </div>
            <div class="col-md-3 col-sm-6  pull-top">
                <select class="form-control selectpicker">
                    <option value="">[--Chọn số phòng tắm--]</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value=">3">Nhiều</option>
                </select>

            </div>
            <div class="col-md-3 col-sm-6  pull-top">
                <select class="form-control selectpicker" multiple="" title="[--Chọn tiện ích đi kèm--]">
                    [{foreach $utilities as $item}]
                        <option value="[{$item->id}]">[{$item->_title}]</option>
                    [{/foreach}]
                </select>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3 col-sm-6  pull-top">
                <select class="form-control selectpicker">
                    <option>[--Chọn Tỉnh/Thành Phố--]</option>
                </select>

            </div>
            <div class="col-md-3 col-sm-6  pull-top">
                <select class="form-control selectpicker">
                    <option>[--Chọn Quận/Huyện--]</option>
                </select>

            </div>
            <div class="col-md-3 col-sm-6  pull-top">
                <select class="form-control selectpicker">
                    <option>[--Chọn Xã/Phường--]</option>
                </select>

            </div>
            <div class="col-md-3 col-sm-6  pull-top">
                <select class="form-control selectpicker">
                    <option>[--Chọn hướng--]</option>
                </select>

            </div>
        </div>
    </div>
</div>
</div>