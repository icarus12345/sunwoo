[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/meta.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/nav.tpl"}]

<div class="wrap">
    <ol class="breadcrumb">
      <li><a href="/">[{$languages.default.home|escape}]</a></li>
      <li><a href="/">[{$languages.default.pages|escape}]</a></li>
      <li class="active">[{$languages.default.contact_us|escape}]</li>
    </ol>
    <div class="contact-us">
        <div class="map"><div id="map"></div></div>
        <style type="text/css">
            #header{
                background-image: url(/assets/sunwoo/images/banner.jpg);
                background-size: cover;
                height: 228px;
            }
            a[href^="http://maps.google.com/maps"],
            a[href^="https://maps.google.com/maps"],
            a[href^="https://www.google.com/maps"] {
                display: none !important;
            }
            .gm-fullscreen-control,
            .gm-svpc{
              display: none;
            }
            .gm-bundled-control .gmnoprint {
                display: block;
            }
            .gmnoprint:not(.gm-bundled-control) {
                display: none;
            }
        </style>

        <div class="contact-form">
            
        </div>
    </div>
</div>
<script type="text/javascript">
    var map_style = [
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
function ContactPopup(position, html) {
    this.position = position;
    var content = document.createElement('div')
    content.innerHTML = html
    content.classList.add('contact-popup-bubble');

    // This zero-height div is positioned at the bottom of the bubble.
    var bubbleAnchor = document.createElement('div');
    bubbleAnchor.classList.add('contact-popup-bubble-anchor');
    bubbleAnchor.appendChild(content);

    // This zero-height div is positioned at the bottom of the tip.
    this.containerDiv = document.createElement('div');
    this.containerDiv.classList.add('contact-popup-container');
    this.containerDiv.appendChild(bubbleAnchor);
    this.content = content;
    // Optionally stop clicks, etc., from bubbling up to the map.
    google.maps.OverlayView.preventMapHitsAndGesturesFrom(this.containerDiv);
}
// ES5 magic to extend google.maps.OverlayView.
ContactPopup.prototype = Object.create(google.maps.OverlayView.prototype);

/** Called when the popup is added to the map. */
ContactPopup.prototype.onAdd = function() {
    this.getPanes().floatPane.appendChild(this.containerDiv);
};

/** Called when the popup is removed from the map. */
ContactPopup.prototype.onRemove = function() {
    if (this.containerDiv.parentElement) {
        this.containerDiv.parentElement.removeChild(this.containerDiv);
    }
};
ContactPopup.prototype.show = function() {
    // if (this.containerDiv.parentElement) {
        this.content.style.display = 'block'
    // }
};
/** Called each frame when the popup needs to draw itself. */
ContactPopup.prototype.draw = function() {
    var divPosition = this.getProjection().fromLatLngToDivPixel(this.position);

    // Hide the popup when it is far out of view.
    var display =
        Math.abs(divPosition.x) < 4000 && Math.abs(divPosition.y) < 4000 ?
        'block' :
        'none';

    if (display === 'block') {
        this.containerDiv.style.left = divPosition.x + 'px';
        this.containerDiv.style.top = divPosition.y + 'px';
    }
    if (this.containerDiv.style.display !== display) {
        this.containerDiv.style.display = display;
    }
};


$(document).ready(function(){
    
    setTimeout(function(){
        

        var mapElement = document.getElementById('map')
        var lat = 10.778114;
        var lon = 106.692965;
        // var latlon = [ 10.771921, 106.678296 ]; // 151.20929550000005&lat=-33.8688197
        // var lat  = latlon[0], lon = latlon[1];
        // Basic options for a simple Google Map
        // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
        var mapOptions = {
            zoom: 16,
            center: new google.maps.LatLng(lat, lon),
            // styles:map_style
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
            var latlng = new google.maps.LatLng(lat, lon)
            
        //     bounds.extend(latlng);

           var content_info ='\
                          <div>\
                              <div class="popheader"></div>\
                              <div class="address">\
                                [A]:126 Nguyá»…n Thá»‹ Minh Khai, P.6, Q.3, TP.HCM<br/>\
                                [T]:126 Nguyá»…n Thá»‹ Minh Khai, P.6, Q.3, TP.HCM<br/>\
                                [E]:126 Nguyá»…n Thá»‹ Minh Khai, P.6, Q.3, TP.HCM\
                              </div>\
                          </div>';
            popup = new ContactPopup(
                latlng,
                content_info
            );
            popup.setMap(map);
        // })
        // map.fitBounds(bounds);
    },300);
    // if(FB) FB.XFBML.parse();
    
});
console.log('****')
</script>
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/foot.tpl"}]
