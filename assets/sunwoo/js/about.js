$(document).ready(function(){
    
    setTimeout(function(){
        if ($('#owl-about').length > 0)    $("#owl-about").owlCarousel({
            autoPlay : 5000,
            stopOnHover : false,
            navigation:false,
            paginationSpeed : 1000,
            //goToFirstSpeed : 2000,
            singleItem : true,
            autoHeight : true,
            margin:10,
            // transitionStyle:"fade"
        });
            console.log($('#owl-about').length,"$('#owl-about').length")
        // map.fitBounds(bounds);
    },500);
    // if(FB) FB.XFBML.parse();
    
});
console.log('****')