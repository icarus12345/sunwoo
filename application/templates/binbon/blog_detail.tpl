[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/meta.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/nav.tpl"}]

<div class="wrap">
    <ol class="breadcrumb">
      <li><a href="/">[{$languages.default.home|escape}]</a></li>
      <li><a href="/blogs">[{$languages.default.blog|escape}]</a></li>
      <li class="active">[{$news_detail->_title|escape}]</li>
    </ol>
    <div class="blogs">
        <div class="blog-item">
            <a href="/blogs/[{$news_detail->_alias|escape}]">
                <img src="[{$news_detail->_thumb|escape}]">
            </a>
            <div>
                <span class="public-at">[{$news_detail->_public_at|escape|date_format }]</span>
                <span class="author">By [{$news_detail->_author|escape}]</span>
                <span class="cate"><i class="fa fa-tags"></i> [{$news_detail->cat_title|escape}]</span>
            </div>
            <a href="/blogs/[{$news_detail->_alias|escape}]">
                <h3>[{$news_detail->_title|escape}]</h3>
                <p>[{$news_detail->_desc|escape}]</p>
            </a>
            <br/>
            <div class="ckeditor">[{$news_detail->_content}]</div>
            <br/>

            <div class="comment-box">
                <h3>[{$languages.default.review|escape}]</h3>

                <div id="wpac-comment"></div>
                <script type="text/javascript">
                wpac_init = window.wpac_init || [];
                wpac_init.push({widget: 'Comment', id: 17753});
                (function() {
                    if ('WIDGETPACK_LOADED' in window) return;
                    WIDGETPACK_LOADED = true;
                    var mc = document.createElement('script');
                    mc.type = 'text/javascript';
                    mc.async = true;
                    mc.src = 'https://embed.widgetpack.com/widget.js';
                    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(mc, s.nextSibling);
                })();
                </script>
            </div>
        </div>
    </div>
</div>
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/foot.tpl"}]
