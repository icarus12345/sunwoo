<div id="jquery-accordion-menu" class="jquery-accordion-menu -default -blue -red green -white -black">
    <!-- <div class="jquery-accordion-menu-header"> Header </div> -->
    <!-- <ul>
        <li class="active">
            <a href="#"> <i class="fa fa-home"> </i> Home </a>
        </li>
        <li>
            <a href="#"> <i class="fa fa-glass"> </i> Events </a>
        </li>
        <li>
            <a href="#"> <i class="fa fa-file-image-o"> </i> Gallery </a> <span class="jquery-accordion-menu-label"> 12 </span> </li>
        <li>
            <a href="#"> <i class="fa fa-cog"> </i> Services </a>
            <ul class="submenu">
                <li> <a href="#"> Web Design </a> </li>
                <li> <a href="#"> Hosting </a> </li>
                <li> <a href="#"> Design </a>
                    <ul class="submenu">
                        <li> <a href="#"> Graphics </a> </li>
                        <li> <a href="#"> Vectors </a> </li>
                        <li> <a href="#"> Photoshop </a> </li>
                        <li> <a href="#"> Fonts </a> </li>
                    </ul>
                </li>
                <li> <a href="#"> Consulting </a> </li>
            </ul>
        </li>
        <li>
            <a href="#"> <i class="fa fa-newspaper-o"> </i> News </a>
        </li>
        <li>
            <a href="#"> <i class="fa fa-suitcase"> </i> Portfolio </a>
            <ul class="submenu">
                <li> <a href="#"> Web Design </a> </li>
                <li> <a href="#"> Graphics </a> <span class="jquery-accordion-menu-label"> 10 </span> </li>
                <li> <a href="#"> Photoshop </a> </li>
                <li> <a href="#"> Programming </a> </li>
            </ul>
        </li>
        <li>
            <a href="#"> <i class="fa fa-user"> </i> About </a>
        </li>
        <li>
            <a href="#"> <i class="fa fa-envelope"> </i> Contact </a>
        </li>
    </ul> -->
    [{include file=$smarty.const.APPPATH|cat:"templates/cms/widget/navimenu.tpl"}]
    [{if $smarty.session.auth.user->ause_authority=='Administrator'}]
        [{include file=$smarty.const.APPPATH|cat:"templates/cms/widget/navimenuAdmin.tpl"}]
    [{/if}]
    <!-- <div class="jquery-accordion-menu-footer"> Footer </div> -->
</div>