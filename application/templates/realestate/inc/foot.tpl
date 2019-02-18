<div class="foot">
    <div class="container pull-top">
        <div class="col-sm-8">
            <div class="row">
                <div class="col-mb-4 pull-top">
                    [{if $lang=='en'}]
                    <img class="foot-logo" src="/assets/nha-dat/img/logo-en.png"/>
                    [{else}]
                    <img class="foot-logo" src="/assets/nha-dat/img/logo.png"/>
                    [{/if}]
                </div>
                <div class="col-mb-8 pull-top">
                    <div class="foot-menu">
                        <a href="/gioi-thieu/chinh-sach-chat-luong">[{$languages.all_quality_policy|default:'CHÍNH SÁCH CHẤT LƯỢNG'}]</a>
                        <a href="/gioi-thieu/lien-he">[{$languages.all_Contact|default:'Liên hệ'}]</a>
                        <a href="/lien-he">[{$languages.all_advisory|default:'GIẢI ĐÁP THẮC MẮC'}]</a>
                    </div>
                    <div class="pull-top">
                        [{$languages.all_addressStr|default:'Địa chỉ : 119 Đường Số 9, Phường 16, Quận Gò Vấp'}]
                    </div>
                    <div class="pull-bottom">
                        [{$languages.all_telStr|default:'Tel : (+84.8) 39168714 - Email : toanloico@yahoo.com.vn'}]
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-4 pull-top">
            <div class="row">
                <div class="pull-bottom col-mb-4 col-sm-12 ">
                    FAMILY SITE 
                    <label class="select-map dropup">
                        <span data-toggle="dropdown">[{$languages.all_select_site|default:'Chọn các site khác'}] <i class="fa fa-caret-right"></i></span>
                        <ul class="dropdown-menu" role="menu">
                            <li ><a href="/" >[{$languages.all_home|default:'Trang chủ'}]</a></li>
                            <li ><a href="/gioi-thieu" >[{$languages.all_about|default:'Giới thiệu'}]</a></li>
                            <li ><a href="/cong-trinh" >[{$languages['all_buildings-project']|default:'Công trình - dự án'}]</a></li>
                            <li ><a href="/noi-that" >[{$languages['all_interior-design']|default:'Thiết kế nội thất'}]</a></li>
                            <li ><a href="/tin-tuc" >[{$languages['all_news']|default:'Tin tức'}]</a></li>
                        </ul>
                    </label>
                </div>
                <div class="pull-bottom col-mb-8 col-sm-12">
                    [{$languages.all_copyrightStr|default:'COPYRIGHT &copy; 2015 Công Ty TNHH Toàn Lợi.'}]
                </div>
            </div>
            
        </div>
    </div>
</div>
<script type="text/javascript" src="libraries/plugin/validation-engine/jquery.validationEngine.js"></script>
<script type="text/javascript" src="libraries/plugin/validation-engine/jquery.validationEngine-en.js"></script>