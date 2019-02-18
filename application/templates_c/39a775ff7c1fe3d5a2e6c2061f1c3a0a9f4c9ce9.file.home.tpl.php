<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 19:10:37
         compiled from "application/templates/realestate/home.tpl" */ ?>
<?php /*%%SmartyHeaderCode:11119131915c6aa0bd599c17-34669877%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '39a775ff7c1fe3d5a2e6c2061f1c3a0a9f4c9ce9' => 
    array (
      0 => 'application/templates/realestate/home.tpl',
      1 => 1437366136,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '11119131915c6aa0bd599c17-34669877',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'sliders' => 0,
    'lang' => 0,
    'foo' => 0,
    'languages' => 0,
    'news_list' => 0,
    'noti_list' => 0,
    'ctProduct' => 0,
    'images' => 0,
    'img' => 0,
    'khProduct' => 0,
    'tkProduct' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6aa0bd6ebb62_10855524',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6aa0bd6ebb62_10855524')) {function content_5c6aa0bd6ebb62_10855524($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/realestate/inc/meta.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<body style="background-image:none">
	<div class="body-slider" style="position:absolute;left:0;width:100%;top:0;height:550px;">
		<div id="owl-demo" class="owl-carousel">
			<?php  $_smarty_tpl->tpl_vars['foo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['foo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['sliders']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['foo']->key => $_smarty_tpl->tpl_vars['foo']->value) {
$_smarty_tpl->tpl_vars['foo']->_loop = true;
?>
            <?php if ($_smarty_tpl->tpl_vars['lang']->value=='en') {?>
			<div class="item bg-100" style="background-image:url('<?php echo $_smarty_tpl->tpl_vars['foo']->value->Image_en;?>
');background-position: top center;"></div>
            <?php } else { ?>  
            <div class="item bg-100" style="background-image:url('<?php echo $_smarty_tpl->tpl_vars['foo']->value->Image;?>
');background-position: top center;"></div>
            <?php }?>
			<?php } ?>
		</div>
	</div>
	<?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/realestate/inc/head.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

		<div class="container pull-bottom">
            <div class="header-space"></div>
            <div class="-row ">
                <div class="video-box">
                    <div class="video-bg">
                        <div class="pull-right">
                            <!-- <div class="primary-color"><b>VIDEO QUẢNG CÁO</b></div> -->
                            <div class="pull-top pull-bottom">
                                <button class="btn btn-xs btn-primary active text-uppercase"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_image'])===null||$tmp==='' ? 'Hình ảnh' : $tmp);?>
</button>
                                <button class="btn btn-xs btn-primary">VIDEO</button>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="video">
                            <div>
                                <video id="my_video" loop autoplay muted>
                                    <source type="video/mp4" src="/assets/nha-dat/img/video/xaydung-3d.mp4">
                                </video>
                                <div class="controls">
                                    <!-- <i class="fa fa-play"></i> -->
                                    <i id="pay-pause" class="fa fa-pause"></i>
                                    <i class="fa fa-stop"></i>
                                    <input id="seekslider" class="seekslider" type="range" min="0" max="100" value="0" step="1">
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="row pull-top">
                <div class="space-line"></div>
                <div class="space-line"></div>
                <div class="space-line"></div>
                <div class="space-line"></div>
                <div class="col-sm-6 col-mb-12">
                    <div class="row">
                        <div class="col-sm-6 col-mb-6 col-xs-12">
                            <div role="tabpanel">
                                <ul class="nav nav-tabs pull-bottom" role="tablist">
                                    <li class="active"><a href="#tintuc" data-toggle="tab"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_news'])===null||$tmp==='' ? 'TIN TỨC' : $tmp);?>
</a></li>
                                    <li class=""><a href="#thongbao" data-toggle="tab"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_notification'])===null||$tmp==='' ? 'THÔNG BÁO' : $tmp);?>
</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="tintuc">
                                        <ul class="list-news">
                                        <?php  $_smarty_tpl->tpl_vars['foo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['foo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['news_list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['foo']->key => $_smarty_tpl->tpl_vars['foo']->value) {
$_smarty_tpl->tpl_vars['foo']->_loop = true;
?>
                                            <li>
                                                <a href="/tin-tuc/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['foo']->value->news_alias, ENT_QUOTES, 'UTF-8', true);?>
">
                                                <?php if ($_smarty_tpl->tpl_vars['lang']->value=='en') {?>
                                                    <div class="line-clamp-1"><?php echo htmlspecialchars((($tmp = @$_smarty_tpl->tpl_vars['foo']->value->news_title_en)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['foo']->value->news_title : $tmp), ENT_QUOTES, 'UTF-8', true);?>
</div>
                                                <?php } else { ?>  
                                                    <div class="line-clamp-1"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['foo']->value->news_title, ENT_QUOTES, 'UTF-8', true);?>
</div>  
                                                <?php }?>
                                                </a>
                                            </li>
                                        <?php }
if (!$_smarty_tpl->tpl_vars['foo']->_loop) {
?>
                                            <li>Dữ liệu đang cập nhật...</li>
                                        <?php } ?>
                                        </ul>
                                        <?php if (count($_smarty_tpl->tpl_vars['news_list']->value)==4) {?>
                                        <a href="/tin-tuc" class="more"></a>
                                        <?php }?>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="thongbao">
                                        <ul class="list-news">
                                        <?php  $_smarty_tpl->tpl_vars['foo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['foo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['noti_list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['foo']->key => $_smarty_tpl->tpl_vars['foo']->value) {
$_smarty_tpl->tpl_vars['foo']->_loop = true;
?>
                                            <li>
                                                <a href="/thong-bao/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['foo']->value->news_alias, ENT_QUOTES, 'UTF-8', true);?>
">
                                                    <?php if ($_smarty_tpl->tpl_vars['lang']->value=='en') {?>
                                                        <div class="line-clamp-1"><?php echo htmlspecialchars((($tmp = @$_smarty_tpl->tpl_vars['foo']->value->news_title_en)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['foo']->value->news_title : $tmp), ENT_QUOTES, 'UTF-8', true);?>
</div>
                                                    <?php } else { ?>  
                                                        <div class="line-clamp-1"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['foo']->value->news_title, ENT_QUOTES, 'UTF-8', true);?>
</div>  
                                                    <?php }?> 
                                                </a>
                                            </li>
                                        <?php }
if (!$_smarty_tpl->tpl_vars['foo']->_loop) {
?>
                                            <li>Dữ liệu đang cập nhật...</li>
                                        <?php } ?>
                                        </ul>
                                        <?php if (count($_smarty_tpl->tpl_vars['noti_list']->value)==4) {?>
                                        <a href="/thong-bao" class="more"></a>
                                        <?php }?>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-mb-6 col-xs-12">
                            <div class="primary-color pull-bottom text-uppercase" ><b><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_buildings-project'])===null||$tmp==='' ? 'Công trình - dự án' : $tmp);?>
</b></div>
                            <div class="product-item">
                                <?php if ($_smarty_tpl->tpl_vars['ctProduct']->value) {?>
                                <div class="product-thumb">
                                    
                                    <div class="nailthumb" onclick="$(this).next().click()">
                                        <div class="nailthumb-figure-75">
                                            <div class="nailthumb-container">
                                                <img src="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['ctProduct']->value->product_thumb, ENT_QUOTES, 'UTF-8', true);?>
" class="lazy"/>
                                            </div>
                                        </div>
                                    </div>
                                    <?php if ((($tmp = @$_smarty_tpl->tpl_vars['ctProduct']->value->product_images)===null||$tmp==='' ? '' : $tmp)!='') {?>
                                        <?php if (isset($_smarty_tpl->tpl_vars['images'])) {$_smarty_tpl->tpl_vars['images'] = clone $_smarty_tpl->tpl_vars['images'];
$_smarty_tpl->tpl_vars['images']->value = preg_split('/\r\n|[\r\n]/',$_smarty_tpl->tpl_vars['ctProduct']->value->product_images); $_smarty_tpl->tpl_vars['images']->nocache = null; $_smarty_tpl->tpl_vars['images']->scope = 0;
} else $_smarty_tpl->tpl_vars['images'] = new Smarty_variable(preg_split('/\r\n|[\r\n]/',$_smarty_tpl->tpl_vars['ctProduct']->value->product_images), null, 0);?>
                                        <?php  $_smarty_tpl->tpl_vars['img'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['img']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['images']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['img']->key => $_smarty_tpl->tpl_vars['img']->value) {
$_smarty_tpl->tpl_vars['img']->_loop = true;
?>
                                        <a class="swipebox" 
                                            href="<?php echo $_smarty_tpl->tpl_vars['img']->value;?>
" 
                                            <?php if ($_smarty_tpl->tpl_vars['lang']->value=='en') {?>
                                            title="<?php echo htmlspecialchars((($tmp = @$_smarty_tpl->tpl_vars['ctProduct']->value->product_title_en)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['ctProduct']->value->product_title : $tmp), ENT_QUOTES, 'UTF-8', true);?>
"data-cap='<?php echo htmlspecialchars((($tmp = @$_smarty_tpl->tpl_vars['ctProduct']->value->product_desc_en)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['ctProduct']->value->product_desc : $tmp), ENT_QUOTES, 'UTF-8', true);?>
'
                                            <?php } else { ?>
                                            title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['ctProduct']->value->product_title, ENT_QUOTES, 'UTF-8', true);?>
"
                                            data-cap='<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['ctProduct']->value->product_desc, ENT_QUOTES, 'UTF-8', true);?>
'
                                            <?php }?>
                                            rel="gallery-<?php echo $_smarty_tpl->tpl_vars['ctProduct']->value->product_id;?>
"
                                            ></a>
                                        <?php } ?>
                                    <?php }?>
                                </div>
                                <div class="product-capt">
                                    <div>
                                        <a href="/cong-trinh/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['ctProduct']->value->product_alias, ENT_QUOTES, 'UTF-8', true);?>
">
                                            <?php if ($_smarty_tpl->tpl_vars['lang']->value=='en') {?>
                                            <strong><div class="line-clamp-1"><?php echo htmlspecialchars((($tmp = @$_smarty_tpl->tpl_vars['ctProduct']->value->product_title_en)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['ctProduct']->value->product_title : $tmp), ENT_QUOTES, 'UTF-8', true);?>
</div></strong>
                                            <?php } else { ?>
                                            <strong><div class="line-clamp-1"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['ctProduct']->value->product_title, ENT_QUOTES, 'UTF-8', true);?>
</div></strong>
                                            <?php }?>
                                        </a>
                                    </div>
                                    <?php if ($_smarty_tpl->tpl_vars['lang']->value=='en') {?>
                                    <p class="line-clamp-4"><?php echo htmlspecialchars((($tmp = @$_smarty_tpl->tpl_vars['ctProduct']->value->product_desc_en)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['ctProduct']->value->product_desc : $tmp), ENT_QUOTES, 'UTF-8', true);?>
</p>
                                    <?php } else { ?>
                                    <p class="line-clamp-4"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['ctProduct']->value->product_desc, ENT_QUOTES, 'UTF-8', true);?>
</p>
                                    <?php }?>
                                    <a href="/cong-trinh/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['ctProduct']->value->product_alias, ENT_QUOTES, 'UTF-8', true);?>
">
                                        <span class="btn btn-xs btn-default"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_readmore'])===null||$tmp==='' ? 'XEM THÊM' : $tmp);?>
 <i class="fa fa-caret-right"></i></span>
                                    </a>
                                </div>
                                <div class="clearfix"></div>
                                <div class="space-line"></div>
                                <div class="space-line"></div>
                                <?php }?>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-sm-6 col-mb-12">
                    <div class="row">
                        <div class="col-sm-6 col-mb-6 col-xs-12">
                            <div class="primary-color text-uppercase"><b><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_interested_customers'])===null||$tmp==='' ? 'Khách hàng quan tâm' : $tmp);?>
</b></div>
                            <div class="product-item pull-top">
                                <?php if ($_smarty_tpl->tpl_vars['khProduct']->value) {?>
                                <div class="product-thumb">
                                    <div class="nailthumb" onclick="$(this).next().click()">
                                        <div class="nailthumb-figure-75">
                                            <div class="nailthumb-container">
                                                <img src="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['khProduct']->value->product_thumb, ENT_QUOTES, 'UTF-8', true);?>
" class="lazy"/>
                                            </div>
                                        </div>
                                    </div>
                                    <?php if ((($tmp = @$_smarty_tpl->tpl_vars['khProduct']->value->product_images)===null||$tmp==='' ? '' : $tmp)!='') {?>
                                        <?php if (isset($_smarty_tpl->tpl_vars['images'])) {$_smarty_tpl->tpl_vars['images'] = clone $_smarty_tpl->tpl_vars['images'];
$_smarty_tpl->tpl_vars['images']->value = preg_split('/\r\n|[\r\n]/',$_smarty_tpl->tpl_vars['khProduct']->value->product_images); $_smarty_tpl->tpl_vars['images']->nocache = null; $_smarty_tpl->tpl_vars['images']->scope = 0;
} else $_smarty_tpl->tpl_vars['images'] = new Smarty_variable(preg_split('/\r\n|[\r\n]/',$_smarty_tpl->tpl_vars['khProduct']->value->product_images), null, 0);?>
                                        <?php  $_smarty_tpl->tpl_vars['img'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['img']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['images']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['img']->key => $_smarty_tpl->tpl_vars['img']->value) {
$_smarty_tpl->tpl_vars['img']->_loop = true;
?>
                                        <a class="swipebox" 
                                            href="<?php echo $_smarty_tpl->tpl_vars['img']->value;?>
" 
                                            <?php if ($_smarty_tpl->tpl_vars['lang']->value=='en') {?>
                                            title="<?php echo htmlspecialchars((($tmp = @$_smarty_tpl->tpl_vars['khProduct']->value->product_title_en)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['khProduct']->value->product_title : $tmp), ENT_QUOTES, 'UTF-8', true);?>
"data-cap='<?php echo htmlspecialchars((($tmp = @$_smarty_tpl->tpl_vars['khProduct']->value->product_desc_en)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['khProduct']->value->product_desc : $tmp), ENT_QUOTES, 'UTF-8', true);?>
'
                                            <?php } else { ?>
                                            title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['khProduct']->value->product_title, ENT_QUOTES, 'UTF-8', true);?>
"
                                            data-cap='<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['khProduct']->value->product_desc, ENT_QUOTES, 'UTF-8', true);?>
'
                                            <?php }?>
                                            rel="gallery-<?php echo $_smarty_tpl->tpl_vars['khProduct']->value->product_id;?>
"
                                            ></a>
                                        <?php } ?>
                                    <?php }?>
                                </div>
                                <div class="product-capt">
                                    <div>
                                        <a href="/cong-trinh/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['khProduct']->value->product_alias, ENT_QUOTES, 'UTF-8', true);?>
">
                                            <?php if ($_smarty_tpl->tpl_vars['lang']->value=='en') {?>
                                            <strong><div class="line-clamp-1"><?php echo htmlspecialchars((($tmp = @$_smarty_tpl->tpl_vars['khProduct']->value->product_title_en)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['khProduct']->value->product_title : $tmp), ENT_QUOTES, 'UTF-8', true);?>
</div></strong>
                                            <?php } else { ?>
                                            <strong><div class="line-clamp-1"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['khProduct']->value->product_title, ENT_QUOTES, 'UTF-8', true);?>
</div></strong>
                                            <?php }?>
                                        </a>
                                    </div>
                                    <?php if ($_smarty_tpl->tpl_vars['lang']->value=='en') {?>
                                    <p class="line-clamp-4"><?php echo htmlspecialchars((($tmp = @$_smarty_tpl->tpl_vars['khProduct']->value->product_desc_en)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['khProduct']->value->product_desc : $tmp), ENT_QUOTES, 'UTF-8', true);?>
</p>
                                    <?php } else { ?>
                                    <p class="line-clamp-4"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['khProduct']->value->product_desc, ENT_QUOTES, 'UTF-8', true);?>
</p>
                                    <?php }?>
                                    <a href="/cong-trinh/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['khProduct']->value->product_alias, ENT_QUOTES, 'UTF-8', true);?>
">
                                        <span class="btn btn-xs btn-default"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_readmore'])===null||$tmp==='' ? 'XEM THÊM' : $tmp);?>
 <i class="fa fa-caret-right"></i></span>
                                    </a>
                                </div>
                                <div class="clearfix"></div>
                                <div class="space-line"></div>
                                <div class="space-line"></div>
                                <?php }?>
                            </div>
                        </div>
                        <div class="col-sm-6 col-mb-6 col-xs-12">
                            <div class="primary-color text-uppercase"><b><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_interior-design'])===null||$tmp==='' ? 'Thiết kế nội thất' : $tmp);?>
</b></div>
                            <div class="product-item pull-top">
                                 <?php if ($_smarty_tpl->tpl_vars['tkProduct']->value) {?>
                                <div class="product-thumb">
                                    <div class="nailthumb" onclick="$(this).next().click()">
                                        <div class="nailthumb-figure-75">
                                            <div class="nailthumb-container">
                                                <img src="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['tkProduct']->value->product_thumb, ENT_QUOTES, 'UTF-8', true);?>
" class="lazy"/>
                                            </div>
                                        </div>
                                    </div>
                                    <?php if ((($tmp = @$_smarty_tpl->tpl_vars['tkProduct']->value->product_images)===null||$tmp==='' ? '' : $tmp)!='') {?>
                                        <?php if (isset($_smarty_tpl->tpl_vars['images'])) {$_smarty_tpl->tpl_vars['images'] = clone $_smarty_tpl->tpl_vars['images'];
$_smarty_tpl->tpl_vars['images']->value = preg_split('/\r\n|[\r\n]/',$_smarty_tpl->tpl_vars['tkProduct']->value->product_images); $_smarty_tpl->tpl_vars['images']->nocache = null; $_smarty_tpl->tpl_vars['images']->scope = 0;
} else $_smarty_tpl->tpl_vars['images'] = new Smarty_variable(preg_split('/\r\n|[\r\n]/',$_smarty_tpl->tpl_vars['tkProduct']->value->product_images), null, 0);?>
                                        <?php  $_smarty_tpl->tpl_vars['img'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['img']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['images']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['img']->key => $_smarty_tpl->tpl_vars['img']->value) {
$_smarty_tpl->tpl_vars['img']->_loop = true;
?>
                                        <a class="swipebox" 
                                            href="<?php echo $_smarty_tpl->tpl_vars['img']->value;?>
" 
                                            <?php if ($_smarty_tpl->tpl_vars['lang']->value=='en') {?>
                                            title="<?php echo htmlspecialchars((($tmp = @$_smarty_tpl->tpl_vars['tkProduct']->value->product_title_en)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['tkProduct']->value->product_title : $tmp), ENT_QUOTES, 'UTF-8', true);?>
"data-cap='<?php echo htmlspecialchars((($tmp = @$_smarty_tpl->tpl_vars['tkProduct']->value->product_desc_en)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['tkProduct']->value->product_desc : $tmp), ENT_QUOTES, 'UTF-8', true);?>
'
                                            <?php } else { ?>
                                            title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['tkProduct']->value->product_title, ENT_QUOTES, 'UTF-8', true);?>
"
                                            data-cap='<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['tkProduct']->value->product_desc, ENT_QUOTES, 'UTF-8', true);?>
'
                                            <?php }?>
                                            rel="gallery-<?php echo $_smarty_tpl->tpl_vars['tkProduct']->value->product_id;?>
"
                                            ></a>
                                        <?php } ?>
                                    <?php }?>
                                </div>
                                <div class="product-capt">
                                    <div>
                                        <a href="/cong-trinh/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['tkProduct']->value->product_alias, ENT_QUOTES, 'UTF-8', true);?>
">
                                            <?php if ($_smarty_tpl->tpl_vars['lang']->value=='en') {?>
                                            <strong><div class="line-clamp-1"><?php echo htmlspecialchars((($tmp = @$_smarty_tpl->tpl_vars['tkProduct']->value->product_title_en)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['tkProduct']->value->product_title : $tmp), ENT_QUOTES, 'UTF-8', true);?>
</div></strong>
                                            <?php } else { ?>
                                            <strong><div class="line-clamp-1"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['tkProduct']->value->product_title, ENT_QUOTES, 'UTF-8', true);?>
</div></strong>
                                            <?php }?>
                                        </a>
                                    </div>
                                    <?php if ($_smarty_tpl->tpl_vars['lang']->value=='en') {?>
                                    <p class="line-clamp-4"><?php echo htmlspecialchars((($tmp = @$_smarty_tpl->tpl_vars['tkProduct']->value->product_desc_en)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['tkProduct']->value->product_desc : $tmp), ENT_QUOTES, 'UTF-8', true);?>
</p>
                                    <?php } else { ?>
                                    <p class="line-clamp-4"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['tkProduct']->value->product_desc, ENT_QUOTES, 'UTF-8', true);?>
</p>
                                    <?php }?>
                                    <a href="/cong-trinh/<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['tkProduct']->value->product_alias, ENT_QUOTES, 'UTF-8', true);?>
">
                                        <span class="btn btn-xs btn-default"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_readmore'])===null||$tmp==='' ? 'XEM THÊM' : $tmp);?>
 <i class="fa fa-caret-right"></i></span>
                                    </a>
                                </div>
                                <div class="clearfix"></div>
                                <div class="space-line"></div>
                                <div class="space-line"></div>
                                <?php }?>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="sm-space"></div>
        </div>
    <?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/realestate/inc/foot.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

    <?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/realestate/widget/popup.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

</body><?php }} ?>
