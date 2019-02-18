$(document).ready(function(){
    $("img.lazy").lazyload({
        load: function() {
            $(this.parentNode).nailthumb();
        }
    });
});