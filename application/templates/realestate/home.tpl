[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/meta.tpl"}]
<body>
	[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/head.tpl"}]
	<div id="wrap" class="cover">
        <div id="header">
            <div class="container">
                <div id="logo" ui-yield-to="logo">
                    <a href="/" class="hover-line" ui-content-for="logo"><span></span></a>
                </div>
                <div class="hot-line"><span class="fa fa-phone-square"></span> VN: (+84) 88 606 3577 | Korea: (+82) 10 4906 5736</div>
                <div id="cnavi" class="nav" ui-yield-to="cnavi"></div>
            </div>
        </div>
        <div id="left-contents-wrap" ui-yield-to="left-contents"></div>
        <div id="contents-wrap">
            <div id="contents">
                <div id="home" class="content">
                    <style type="text/css">
                        #wrap{
                            background-image: url(/assets/sunwoo/images/home-bg.jpg);
                        }
                    </style>
                    <div class="box-search">
                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Cho thuê</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Bán</a></li>
                        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Dự án</a></li>
                        <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Ðầu tư</a></li>
                      </ul>

                      <!-- Tab panes -->
                      <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active">
                            <div class="pull-bottom">
                                <div class="input-group">
                                  <input type="text" class="form-control" placeholder="Search for...">
                                  <span class="input-group-btn">
                                    <a class="btn btn-default" type="button" href="/project.html">Tìm kiếm</a>
                                  </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 col-sm-6 pull-bottom">
                                    <select class="form-control">
                                        <option>Chọn loại hình</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6 pull-bottom">
                                    <select class="form-control">
                                        <option>Chọn diện tích</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6 pull-bottom">
                                    <select class="form-control">
                                        <option>Chọn phòng ngủ</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6 pull-bottom">
                                    <select class="form-control">
                                        <option>Chọn bảng giá</option>
                                    </select>

                                </div>
                            </div>
                            <div>Tìm kiếm nâng cao</div>
                            <div class="row">
                                <div class="col-md-3 col-sm-6 pull-top">
                                    <select class="form-control">
                                        <option>Chọn loại hình</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6  pull-top">
                                    <select class="form-control">
                                        <option>Chọn diện tích</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6  pull-top">
                                    <select class="form-control">
                                        <option>Chọn phòng ngủ</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6  pull-top">
                                    <select class="form-control">
                                        <option>Chọn bảng giá</option>
                                    </select>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-sm-6  pull-top">
                                    <select class="form-control">
                                        <option>Chọn loại hình</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6  pull-top">
                                    <select class="form-control">
                                        <option>Chọn diện tích</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6  pull-top">
                                    <select class="form-control">
                                        <option>Chọn phòng ngủ</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6  pull-top">
                                    <select class="form-control">
                                        <option>Chọn bảng giá</option>
                                    </select>

                                </div>
                            </div>
                            
                        </div>
                      </div>
                    </div>
                </div>
                
            </div>
        </div>


    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
</body>