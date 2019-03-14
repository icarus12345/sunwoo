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
        // map.fitBounds(bounds);
        if ($('#owl-related').length > 0) $("#owl-related").owlCarousel({
            autoPlay : 5000,
            stopOnHover : false,
            navigation:false,
            pagination : false,
            paginationSpeed : 1000,
            //goToFirstSpeed : 2000,
            // singleItem : true,
            autoHeight : true,
            items: 3
            // transitionStyle:"fade"
        });
        
        if(FB) FB.XFBML.parse();
    },300);
});
console.log('****')