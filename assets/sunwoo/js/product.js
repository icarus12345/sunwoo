$(document).ready(function(){
    setTimeout(function(){

        var mapElement = document.getElementById('map')
        var lat = 10;
        var lon = 106;
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

            marker._data = item
            google.maps.event.addListener(marker, 'click', (function(marker) {
                return function() {
                    var content_info ='\
                          <div style="width:240px;font-size:13px;">\
                              <img style="width:100%" src="' + marker._data.product_thumb + '" style="float:left;margin-right:5px"/>\
                              <div><h4 style="margin:0;padding:4px 0;color:#ee4034">' + marker._data.product_title_vi + '</h4></div>\
                              <div>Phone : 098 263 6618 (có kết nối bằng zalo & viber)<br/>Email: dongocmai1305@gmail.com</div>\
                              <div>Đ/c : <i>108/46 Trần Quang Diệu, Phường 14. Quận 3 - TP Hồ Chí Minh</i></div>\
                          </div>';
                    infowindow.setContent(content_info);
                    console.log(marker._data)
                    infowindow.open(map, marker);
                };
            })(marker));

            var content_info ='\
                          <div style="width:240px;font-size:13px;">\
                              <img style="width:100%" src="' + marker._data.product_thumb + '" style="float:left;margin-right:5px"/>\
                              <div><h4 style="margin:0;padding:4px 0;color:#ee4034">' + marker._data.product_title_vi + '</h4></div>\
                              <div>Phone : 098 263 6618 (có kết nối bằng zalo & viber)<br/>Email: dongocmai1305@gmail.com</div>\
                              <div>Đ/c : <i>108/46 Trần Quang Diệu, Phường 14. Quận 3 - TP Hồ Chí Minh</i></div>\
                          </div>';
            popup = new Popup(
                latlng,
                content_info
            );
            popup.setMap(map);
        })
        map.fitBounds(bounds);
    },150)
})