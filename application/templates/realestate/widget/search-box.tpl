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
        <div class="input-group">
          <input type="text" class="form-control" placeholder="Search for...">
          <span class="input-group-btn">
            <a class="btn btn-default" type="button" id="btn-search" href="/rent">Tìm kiếm</a>
          </span>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3 col-sm-6 pull-bottom">
            <select class="form-control selectpicker">
                <option>Chọn loại hình</option>
            </select>

        </div>
        <div class="col-md-3 col-sm-6 pull-bottom">
            <select class="form-control selectpicker">
                <option value="">Chọn diện tích</option>
                <option value="100">Dưới 100m2</option>
                <option value="200">Từ 100m2-200m2</option>
            </select>

        </div>
        <div class="col-md-3 col-sm-6 pull-bottom">
            <select class="form-control selectpicker">
                <option value="">Chọn phòng ngủ</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value=">3">Nhiều</option>
            </select>

        </div>
        <div class="col-md-3 col-sm-6 pull-bottom">
            <select class="form-control selectpicker">
                <option value="">Chọn bảng giá</option>
                <option value="1">Dưới 1 Tỷ</option>
                <option value="2">Từ 1 - 2 Tỷ</option>
                <option value="3">Từ 2 - 3 Tỷ</option>
                <option value=">3">Trên 3 Tỷ</option>
            </select>

        </div>
    </div>
    <div>Tìm kiếm nâng cao</div>
    <div class="row">
        <div class="col-md-3 col-sm-6 pull-top">
            <select class="form-control selectpicker">
                <option value="">Chọn Số tầng</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value=">3">Nhiều</option>
            </select>

        </div>
        <div class="col-md-3 col-sm-6  pull-top">
            <select class="form-control selectpicker">
                <option value="">Chọn số phòng ngủ</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value=">3">Nhiều</option>
            </select>

        </div>
        <div class="col-md-3 col-sm-6  pull-top">
            <select class="form-control selectpicker">
                <option value="">Chọn số phòng tắm</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value=">3">Nhiều</option>
            </select>

        </div>
        <div class="col-md-3 col-sm-6  pull-top">
            <select class="form-control selectpicker">
                <option>Chọn tiện ích đi kèm</option>
            </select>

        </div>
    </div>

    <div class="row">
        <div class="col-md-3 col-sm-6  pull-top">
            <select class="form-control selectpicker">
                <option>Chọn Xã/Phường</option>
            </select>

        </div>
        <div class="col-md-3 col-sm-6  pull-top">
            <select class="form-control selectpicker">
                <option>Chọn Quận/Huyện</option>
            </select>

        </div>
        <div class="col-md-3 col-sm-6  pull-top">
            <select class="form-control selectpicker">
                <option>Chọn Tỉnh/Thành Phố</option>
            </select>

        </div>
        <div class="col-md-3 col-sm-6  pull-top">
            <select class="form-control selectpicker">
                <option>Chọn hướng</option>
            </select>

        </div>
    </div>
    
</div>
</div>