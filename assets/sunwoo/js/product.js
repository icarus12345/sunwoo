$(document).ready(function(){
    setTimeout(function(){
        
        app.switch_search = function(page){
            $('#searchFrm').attr('action','/'+page).submit()
        }
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
            bounds.extend(latlng);

            var content_info ='\
                          <div class="product-balloon" style="width:240px;font-size:13px;">\
                              <div class="thumb cover" style="background-image:url(' + item.product_thumb + ');padding-top:56.4%">\
                                  ' + (item.product_is_hot==1?'<span class="hot"><span class="fa fa-star"></span></span>':'') + '\
                                  <div class="tag"><span>' + item.cat_title + '</span></div>\
                                  <div class="price">' + (1*item.product_price) + 'VND</div>\
                              </div>\
                              <div class="info" style="padding:5px">\
                                <div class="name"><h4><span class="line-clamp-1">' + item.product_title + '</span></h4></div>\
                                <div class="addr"><span class="line-clamp-1">' + item.product_address + '</span></div>\
                                <div class="serv">\
                                    <table>\
                                      <tr>\
                                        <td><span class="fa fa-moon"></span> ' + item.product_bedroom + '</td>\
                                        <td><span class="fa fa-tint"></span> ' + item.product_bathroom + '</td>\
                                        <td><span class="fa fa-expand"></span> ' + item.product_acreage + 'm2</td>\
                                      </tr>\
                                    </table>\
                                </div>\
                                <div><a class="btn btn-sm btn-success btn-block" href="/project/detail/' + item.product_id + '">XEM CHI TIẾT</a></div>\
                              </div>\
                          </div>';
            popup = new Popup(
                latlng,
                content_info
            );
            popup.setMap(map);
            $('[data-pid="'+item.product_id+'"]').click(function(){
              map.panTo(latlng)
            })
        })

        if( app.product_list>1) map.fitBounds(bounds);
        app.init_search();
    },300)
})