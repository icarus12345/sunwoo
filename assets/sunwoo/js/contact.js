app.map_style = [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#263c3f"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#6b9a76"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#38414e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#212a37"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9ca5b3"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#1f2835"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#f3d19c"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#2f3948"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#515c6d"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  }
];
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
            zoom: 16,
            center: new google.maps.LatLng(lat, lon),
            // styles:app.map_style
        };
        // Get the HTML DOM element that will contain your map 
        // We are using a div with id="map" seen below in the <body>
        // Create the Google Map using our element and options defined above
        var map = new google.maps.Map(mapElement, mapOptions);

        // console.log(app.product_list,'app.product_list')
        // var infowindow = new google.maps.InfoWindow();
        
        // infowindow.setPosition(new google.maps.LatLng(lat, lon));
        // var bounds = new google.maps.LatLngBounds();

        // app.product_list.map(function(item){
        //     var latlng = new google.maps.LatLng(item.product_lat, item.product_lng)
            
        //     bounds.extend(latlng);

        //    var content_info ='\
        //                   <div class="product-balloon" style="width:240px;font-size:13px;">\
        //                       <div class="thumb cover" style="background-image:url(' + item.product_thumb + ');padding-top:56.4%">\
        //                           ' + (item.product_is_hot==1?'<span class="hot"><span class="fa fa-star"></span></span>':'') + '\
        //                           <div class="tag"><span>' + item.cat_title + '</span></div>\
        //                           <div class="price">' + (1*item.product_price) + 'VND</div>\
        //                       </div>\
        //                       <div class="info" style="padding:5px">\
        //                         <div class="name"><h4><span class="line-clamp-1">' + item.product_title + '</span></h4></div>\
        //                         <div class="addr"><span class="line-clamp-1">' + item.product_address + '</span></div>\
        //                         <div class="serv">\
        //                             <table>\
        //                               <tr>\
        //                                 <td><span class="fa fa-moon"></span> ' + item.product_bedroom + '</td>\
        //                                 <td><span class="fa fa-tint"></span> ' + item.product_bathroom + '</td>\
        //                                 <td><span class="fa fa-expand"></span> ' + item.product_acreage + 'm2</td>\
        //                               </tr>\
        //                             </table>\
        //                         </div>\
        //                         <div><a class="btn btn-sm btn-success btn-block" href="/project/detail/' + item.product_id + '">XEM CHI TIẾT</a></div>\
        //                       </div>\
        //                   </div>';
        //     popup = new Popup(
        //         latlng,
        //         content_info
        //     );
        //     popup.setMap(map);
        // })
        // map.fitBounds(bounds);
    },300);
    if(FB) FB.XFBML.parse();
    
});
console.log('****')