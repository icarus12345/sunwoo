<div class="tracker-body">
    <div class="container">
        <div style="max-width: 380px;margin: 0 auto;padding: 20px 0">
            <h2 style="text-align: center;color: #FFF;margin: 0;padding: 4px 0;font-size: 40px">TRACK SELECT</h2>
            <h4 style="font-weight: normal;text-align: center;color: #ccc;margin: 0;padding: 4px 0">get right to your need</h4>
            <div style="padding: 20px 0">
                <div class="input-group search-mode">
                    <input type="text" class="form-control" placeholder="Search mode" aria-describedby="basic-addon2">
                    <span class="input-group-addon">
                        <i class="glyphicon glyphicon-search"></i>
                    </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="tracker-list">
                [{foreach from=$categories item=foo}]
                <div class="col-xs-6 col-md-3">
                    <div class="row">
                        <div class="tracker-item">
                            <a href="/track/[{$foo->cat_alias|escape:'html'}]">
                                <div class="nailthumb">
                                    <div class="nailthumb-figure-square">
                                        <div class="nailthumb-container">
                                            <img data-original="[{$foo->cat_thumb|escape:'html'}]" class="lazy"/>
                                        </div>
                                        <div class="nailthumb-mark"></div>
                                        <div class="nailthumb-caption">
                                            <img src="[{$foo->cat_image|escape:'html'}]" class="caption-title"/>
                                            <div class="caption-desc">
                                                <p class="line-clamp-4 text-center">[{$foo->cat_desc|escape:'html'}]</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                [{/foreach}]
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>