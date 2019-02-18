<script type="text/javascript">
var videoPlugin = {
	getYoutubeInfo : function(){
		httpRequest({
            'url'         :   base_url + 'cms/vp/video/onGetVideoInfo/',
            'data'        :   {
            	'video_type' : document.entryForm.video_type.value,
                'video_id'	:   document.entryForm.video_sourceid.value
            },
            'callback'    :   function(rsdata){
                if(rsdata.result<0){
                    $('body').removeClass('is-entry');
                    addNotice(rsdata.message,'danger');
                }else{
                    document.entryForm.video_title.value = rsdata.video.title;
                    document.entryForm.video_desc.value = rsdata.video.description;
                    document.entryForm.video_thumb.value = rsdata.video.thumbnail;
                    document.entryForm.video_link.value = rsdata.video.src;
                    document.entryForm.video_title.value = rsdata.video.title;
                    document.entryForm.video_tag.value = rsdata.video.tag;
                    document.entryForm.video_source.value = '<iframe src="//youtube.com/v/'+document.entryForm.video_sourceid.value+'?version=3&f=videos&app=youtube_gdata"></iframe>';
                    document.entryForm.video_title.onblur();
                }
            }
        }).call();
	}
}
</script>