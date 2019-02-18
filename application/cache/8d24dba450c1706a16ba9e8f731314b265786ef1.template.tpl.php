<?php /*%%SmartyHeaderCode:20676549f91c66507f7-69696039%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8d24dba450c1706a16ba9e8f731314b265786ef1' => 
    array (
      0 => 'application\\templates\\vietthang\\template.tpl',
      1 => 1419768064,
      2 => 'file',
    ),
    '1806cc1a02bf2e820fbb90f5872b8869c6e9fc93' => 
    array (
      0 => 'application\\templates\\vietthang\\vietthang.conf',
      1 => 1419768045,
      2 => 'file',
    ),
    '54b5be752f426ae3ce7c0604cbff63d9fb6aa94d' => 
    array (
      0 => 'application\\templates\\vietthang\\inc\\meta.tpl',
      1 => 1419776073,
      2 => 'file',
    ),
    '8c930c8641fe227ae6377261f5db96cd5e64ea4e' => 
    array (
      0 => 'application\\templates\\vietthang\\inc\\head.tpl',
      1 => 1419747740,
      2 => 'file',
    ),
    'a3bc52e4d2a51f5f59bb0b4f03f1437811ced775' => 
    array (
      0 => 'application\\templates\\vietthang\\layout\\home.tpl',
      1 => 1419779074,
      2 => 'file',
    ),
    '0b109c74b73da8e383eeeef32325d29bc2e40390' => 
    array (
      0 => 'application\\templates\\vietthang\\widget\\slider.tpl',
      1 => 1419767878,
      2 => 'file',
    ),
    '00795278773858f6196912cc62f861bc4290b80c' => 
    array (
      0 => 'application\\templates\\vietthang\\widget\\cate.tpl',
      1 => 1419776252,
      2 => 'file',
    ),
    'b0cf7f6cb96fcf088891e67239a7518bec549780' => 
    array (
      0 => 'application\\templates\\vietthang\\inc\\foot.tpl',
      1 => 1419767828,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20676549f91c66507f7-69696039',
  'cache_lifetime' => 60,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_54a01f15846694_08100957',
  'has_nocache_code' => false,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54a01f15846694_08100957')) {function content_54a01f15846694_08100957($_smarty_tpl) {?>                <!DOCTYPE html>
<html lang="en">
    <head>
        <title>Việt Thắng ĐAK Nông</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="shortcut icon" href="http://local.ci.com/libraries/images/tk1109_green.jpg" type="image/x-icon">
        <meta name="viewport" content="width=device-width; initial-scale=1.0, minimum-scale=1.0, user-scalable=no" />
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/ui/themes/base/jquery.ui.all.css"/>
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/bootstrap/css/bootstrap-select.min.css"/>
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/plugin/select2/select2.css"/>
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/bootstrap/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/vietthang/vietthang.css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,400italic' rel='stylesheet' type='text/css'>
        
        <script type="text/javascript" src="http://local.ci.com/libraries/bootstrap/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/ui/js/jquery-ui-1.9.2.custom.min.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/plugin/validation-engine/jquery.validationEngine.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/plugin/validation-engine/jquery.validationEngine-en.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/plugin/mCustomSrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
        <script type="text/javascript" src="/libraries/plugin/jquery.nailthumb.1.1.js"></script>
        <script type="text/javascript" src="/libraries/plugin/jquery.lazyload.min.js"></script>
        <script type="text/javascript" src="/libraries/vietthang/vietthang.js"></script>
        <!--[if IE]>
            <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js"></script>
        <![endif]-->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>

<header id="navbar" class="navbar" role="banner">
    <div class="container">

        <div class="navbar-header">
            
            <a href="#" class="navbar-brand">
                <img src="/libraries/vietthang/images/logo.png"/>
                <div class="company-title">CTY&nbsp;TNHH&nbsp;DỊCH&nbsp;VỤ&nbsp;VÀ&nbsp;THƯƠNG&nbsp;MẠI</div>
                <div class="company-name">VIỆT THẮNG ĐAK NÔNG</div>
            </a>
            <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                <div>
                    <span class="icon-bar line-1"></span>
                    <span class="icon-bar line-2"></span>
                    <span class="icon-bar line-3"></span>
                </div>
                <span class="menu-text">MENU</span>
            </button>
        </div>
        <nav id="navigation" class="collapse navbar-collapse bs-navbar-collapse" role="navigation" style="overflow: hidden" >

            <ul class="nav navbar-nav pull-right">
                <li><a href="#">TRANG&nbsp;CHỦ</a></li>
                <li><a href='#'>GIỚI&nbsp;THIỆU</a></li>
                <li><a href='#'>SẢN&nbsp;PHẨM</a></li>
                <li><a href='#'>ĐẠI&nbsp;LÝ</a></li>
                <li><a href='#'>TIN&nbsp;TỨC</a></li>
                <li><a href='#'>TUYỂN&nbsp;DỤNG</a></li>
                <li><a href='#'>LIÊN&nbsp;HỆ</a></li>
            </ul>
        </nav>
    </div>
</header>
    <div style="margin:0 auto;position:relative">
    <div 
            id="carousel-banner-home" 
            class="carousel slide carousel-fade" data-ride="carousel"
            data-interval="5000" data-pause="false"
            >
            <ol class="carousel-indicators">
                    <li data-target="#carousel-banner-home" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-banner-home" data-slide-to="1"></li>
            </ol>
            <div class="carousel-inner">
                    <div class="item active">
                            <div>
                                    <img style="width:100%" src="/libraries/vietthang/images/slider1.jpg">
                            </div>
                    </div>
                    <div class="item ">
                            <div>
                                    <img style="width:100%" src="/libraries/vietthang/images/slider2.jpg">
                            </div>
                    </div>
            </div>
            <a class="left carousel-control" href="#carousel-banner-home" role="button" data-slide="prev">
                    <span></span>
            </a>
            <a class="right carousel-control" href="#carousel-banner-home" role="button" data-slide="next">
            <span></span>
            </a>
    </div>
</div>
<div class="container">
    <div class="row cate-products pull-bottom pull-top">
                            <div class="col-sm-3 col-mb-6 pull-bottom pull-top">
            <div class="cate-product">
                <h4>THUỐC TRỪ SÂU</h4>
                <div class="nailthumb">
                    <div class="nailthumb-figure v-t">
                        <div class="nailthumb-container">
                            <img data-original="/data/image/cate/c1.jpg" 
                                 class="lazy nailthumb-image" 
                                 alt="THUỐC TRỪ SÂU">
                        </div>
                    </div>
                </div>
            </div>
        </div>
                    <div class="col-sm-3 col-mb-6 pull-bottom pull-top">
            <div class="cate-product">
                <h4>THUỐC TRỪ CỎ</h4>
                <div class="nailthumb">
                    <div class="nailthumb-figure v-t">
                        <div class="nailthumb-container">
                            <img data-original="/data/image/cate/c2.jpg" 
                                 class="lazy nailthumb-image" 
                                 alt="THUỐC TRỪ CỎ">
                        </div>
                    </div>
                </div>
            </div>
        </div>
                    <div class="col-sm-3 col-mb-6 pull-bottom pull-top">
            <div class="cate-product">
                <h4>THUỐC TRỪ BỆNH</h4>
                <div class="nailthumb">
                    <div class="nailthumb-figure v-t">
                        <div class="nailthumb-container">
                            <img data-original="/data/image/cate/c1.jpg" 
                                 class="lazy nailthumb-image" 
                                 alt="THUỐC TRỪ BỆNH">
                        </div>
                    </div>
                </div>
            </div>
        </div>
                    <div class="col-sm-3 col-mb-6 pull-bottom pull-top">
            <div class="cate-product">
                <h4>PHÂN BÓN - HÓA CHẤT</h4>
                <div class="nailthumb">
                    <div class="nailthumb-figure v-t">
                        <div class="nailthumb-container">
                            <img data-original="/data/image/cate/c2.jpg" 
                                 class="lazy nailthumb-image" 
                                 alt="PHÂN BÓN - HÓA CHẤT">
                        </div>
                    </div>
                </div>
            </div>
        </div>
                            
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-8 col-md-9">
            <div class="green-title">
                SẢN PHẨM MỚI
                <span class="pagination"><ul><li class="page prev"><a href="/vietthang/home/index/2">‹</a></li><li class="page"><a href="/vietthang/home/index/">1</a></li><li class="page"><a href="/vietthang/home/index/2">2</a></li><li class="active"><span>3</span></li><li class="page"><a href="/vietthang/home/index/4">4</a></li><li class="page"><a href="/vietthang/home/index/5">5</a></li><li class="page next"><a href="/vietthang/home/index/4">›</a></li></ul></span>
            </div>
            <div class="product-list">
                <div class="row">
                                                                <div class="col-sm-6 col-md-4 col-lg-3  pull-bottom pull-top">
                        <div class="product">
                            <div class="nailthumb">
                                <div class="nailthumb-figure v-t">
                                    <div class="nailthumb-container">
                                        <img data-original="/data/image/cate/c1.jpg" 
                                            class="lazy nailthumb-image" 
                                            alt="Thuốc trừ nhện">
                                    </div>
                                </div>
                            </div>
                            <h4>Thuốc trừ nhện</h4>
                        </div>
                    </div>
                                                            </div>
            </div>
        </div>
        <div class="col-sm-4 col-md-3">
            <div class="hot-line">
                <div class="ht">
                    HOT<br/>LINE
                </div>
                <p>0123 456 789</p>
                <p>0123 456 789</p>
                <div class="clearfix"></div>
            </div>
            <div class="green-title">
                TIN TỨC
            </div>
            <div class="product-list">
            </div>
        </div>
    </div>
</div>
<div class="foot">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div style="color: #FFF;font-size: 13px;text-decoration: underline">CÔNG TY TNHH DỊCH VỤ VÀ THƯƠNG MẠI VIỆT THẮNG ĐAK NÔNG</div>
                <div style="color: #FFF;font-size: 12px;font-style: italic">
                    Giấy chứng nhận ĐKKD số 0102637020 do sở Kế Hoạch và Đầu Tư Hà Nội cấp ngày 01/02/1097
                </div>
                <div style="font-size: 12px;color: #FFF">BẢN QUYỀN &copy;2015 THUỘC VỀ VIỆT THẮNG ĐAK NÔNG</div>
            </div>
            <div class="col-md-7">
                <div class="row">
                    <div class="col-md-6">
                        <div style="color: #FFF;font-size: 13px;text-decoration: underline">
                            TRỤ SỞ VÀ VĂN PHÒNG GIAO DỊCH
                        </div>
                        <div style="color: #FFF;font-size: 12px;">
                            Địa chỉ Thôn 3, Xã Quảng Tín, Huyện Đak R'Lấp, Tỉnh ĐAK Nông
                        </div>
                        <div style="font-size: 12px;color: #FFF">
                                Tel: 05013 502667 / DTDD: 098444086 - 098444086
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div style="color: #FFF;font-size: 13px;text-decoration: underline">
                            CHI NHÁNH TP HỒ CHÍ MINH
                        </div>
                        <div style="color: #FFF;font-size: 12px;">
                            Địa chỉ: 58/19 ấp Tiền Lân, xã Bà Điểm, huyện Hóc Môn, TP Hồ Chí Minh
                        </div>
                        <div style="font-size: 12px;color: #FFF">
                                Tel: 05013 502667 / Fax: 08.6254.1778 / DTDD: 098444086 - 098444086
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><?php }} ?>
