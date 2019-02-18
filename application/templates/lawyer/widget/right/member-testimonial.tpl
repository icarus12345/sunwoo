<!-- -->
<div class="row half">
    <div class="col-md-6 half">
        <div class="title orange">
            <div><i class="fa fa-user-secret"></i> MEMBERSHIP</div>
        </div>
        <div class="memberships">
            <div id="memberships-gallery" class="owl-carousel owl-gallery">
                [{foreach from=$staffs item=foo}]
                    <div class="item staff dark">
                        <div class="">
                            <div class=" line-clamp-4">[{$foo->data_desc|escape:'html'}]</div>
                            <div class="space-line"></div>
                            <div class="name">
                                <div>[{$foo->data_title|escape:'html'}]</div>
                                <span class="date">[{$foo->data_subtitle|escape:'html'}]</span><br>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <img class="av" src="[{$foo->data_thumb|escape:'html'}]">
                        </div>
                    </div>
                [{/foreach}]
            </div>
        </div>
        <div class="space-line"></div>
    </div>
    
    <!-- -->
    <div class="col-md-6 half">
        <div class="title orangered">
            <div><i class="fa fa-comments"></i> Advisory</div>
        </div>
        <div id="owl-testimonial"
            class="carousel slide carousel-fade" data-ride="carousel"
            data-interval="5000" data-pause="false">
            <!-- <ol class="carousel-indicators">
                <li data-target="#owl-testimonial" data-slide-to="0" class="active"></li>
                <li data-target="#owl-testimonial" data-slide-to="1"></li>
            </ol> -->
            <div class="carousel-inner">
                [{assign var="f" value=true}]
                [{foreach from=$advisory_feature item=foo}]
                <div class="item [{if $f}]active[{/if}]">
                    <div class="testimonial">
                        <div class="ballon">
                            <div class="line-clamp-6">
                                [{$foo->advisory_desc|escape:'html'}]
                            </div>
                        </div>
                        <div class="u">
                            <i class="fa fa-clock-o"></i> <span class="date">[{$foo->advisory_insert|date_format:"%a %d-%m, %Y"}] |</span>
                            <i class="fa fa-user"></i> [{$foo->advisory_name|escape:'html'}]
                        </div>
                    </div>
                </div>
                [{assign var="f" value=false}]
                [{/foreach}]
            </div>
        </div>
        <div class="space-line"></div>
    </div>
</div>
<div class="clearfix"></div>