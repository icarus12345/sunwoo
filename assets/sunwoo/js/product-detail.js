$(document).ready(function(){
    
    setTimeout(function(){
        if ($('#owl-demo').length > 0)    $("#owl-demo").owlCarousel({
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
        if ($('#owl-related').length > 0) $("#owl-related").owlCarousel({
            autoPlay : 5000,
            stopOnHover : false,
            navigation:true,
            paginationSpeed : 1000,
            //goToFirstSpeed : 2000,
            // singleItem : true,
            autoHeight : true,
            items: 3
            // transitionStyle:"fade"
        });

        var mapElement = document.getElementById('map')
        var lat = 10;
        var lon = 106;
        if(app.product_list){
            lat = app.product_list[0].product_lat
            lon = app.product_list[0].product_lng
        }
        // var latlon = [ 10.771921, 106.678296 ]; // 151.20929550000005&lat=-33.8688197
        // var lat  = latlon[0], lon = latlon[1];
        // Basic options for a simple Google Map
        // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
        var mapOptions = {
            zoom: 12,
            center: new google.maps.LatLng(lat, lon),
        };
        // Get the HTML DOM element that will contain your map 
        // We are using a div with id="map" seen below in the <body>
        // Create the Google Map using our element and options defined above
        var map = new google.maps.Map(mapElement, mapOptions);
        console.log(app.product_list,'app.product_list')
        var infowindow = new google.maps.InfoWindow();
        
        infowindow.setPosition(new google.maps.LatLng(lat, lon));
        var bounds = new google.maps.LatLngBounds();

        app.product_list.map(function(item){
            var latlng = new google.maps.LatLng(item.product_lat, item.product_lng)
            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
                draggable:true,

            });
            bounds.extend(latlng);

            var content_info ='\
                          <div style="width:240px;font-size:13px;">\
                              <div class="cover" style="background-image:url(' + item.product_thumb + ');padding-top:56.4%"></div>\
                              <div style="padding:5px">\
                                <div><h4 style="margin:0;padding:4px 0;color:#ee4034">' + item.product_title_vi + '</h4></div>\
                                <div>' + item.product_desc_vi + '</div>\
                                <div><a class="label label-success" href="">Chi tiet</a></div>\
                              </div>\
                          </div>';
            popup = new Popup(
                latlng,
                content_info
            );
            popup.setMap(map);
        })
        // map.fitBounds(bounds);
    },300);
    if(FB) FB.XFBML.parse();
    
});
console.log('****')