<div id="playlist-widget" style="position:absolute;top:0;right:0;height:100%;width:100%;background:#fff;z-index:1001;display:none">
	<ul class="navbar-icons" style="position: absolute;right: 10px;top: -33px;z-index:1001">
		<li><a href="JavaScript:" title="Add new Playlist" onclick="playlistApp.onAddItem()"><i class="fa fa-plus"></i></a></li>
        <li><a href="JavaScript:" title="Back to Video list" onclick="playlistApp.close()"><i class="fa fa-reply-all"></i></a></li>
    </ul>
    <div id= "jqwidget-playlist-list"></div>
</div>
[{include file=$smarty.const.APPPATH|cat:"templates/cms/vp/video_audio/playlistApp.tpl"}]