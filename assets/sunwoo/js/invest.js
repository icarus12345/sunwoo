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
            zoom: 4,
            center: new google.maps.LatLng(lat, lon),
            styles:app.map_style
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
        //     var marker = new google.maps.Marker({
        //         position: latlng,
        //         map: map,
        //         draggable:true,

        //     });
        //     bounds.extend(latlng);

        //     var content_info ='\
        //                   <div style="width:240px;font-size:13px;">\
        //                       <div class="cover" style="background-image:url(' + item.product_thumb + ');padding-top:56.4%"></div>\
        //                       <div style="padding:5px">\
        //                         <div><h4 style="margin:0;padding:4px 0;color:#ee4034">' + item.product_title_vi + '</h4></div>\
        //                         <div>' + item.product_desc_vi + '</div>\
        //                         <div><a class="label label-success" href="">Chi tiet</a></div>\
        //                       </div>\
        //                   </div>';
        //     popup = new Popup(
        //         latlng,
        //         content_info
        //     );
        //     popup.setMap(map);
        // })
        // map.fitBounds(bounds);
    },300)
})