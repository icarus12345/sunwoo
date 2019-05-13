[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/meta.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/nav.tpl"}]

<div class="wrap">
    <ol class="breadcrumb">
      <li><a href="/">[{$languages.default.home|escape}]</a></li>
      <li><a href="/">[{$languages.default.pages|escape}]</a></li>
      <li class="active">[{$languages.default.contact_us|escape}]</li>
    </ol>
    <div class="contact-us">
        <h2>[{$languages.default.how_to_find_us|escape}]</h2>

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
            <div>
                <form id="advisoryForm" name="advisoryForm" >
                    <h2>[{$languages.default.send_us_a_message|escape}]</h2>
                    <div class="row">
                        <div class="col-sm-6">
                            <input type="hidden" name="advisory_type" value="contact">
                            <div class="form-group">
                            <label for="exampleInputEmail1">[{$languages.default.full_name|escape}]</label>
                            <input type="text" class="form-control validate[required]" name="advisory_name" placeholder="">
                            </div>
                            <div class="form-group">
                            <label for="exampleInputPassword1">[{$languages.default.phone|escape}]</label>
                            <input type="text" class="form-control validate[required]" name="advisory_desc" placeholder="">
                            </div>
                            <div class="form-group">
                            <label for="exampleInputPassword1">Email</label>
                            <input type="email" class="form-control validate[required,custom[email]]" name="advisory_email" placeholder="">
                            </div>
                            <br/>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                            <label for="exampleInputPassword1">[{$languages.default.content|escape}]</label>
                            <textarea rows="8" class="form-control validate[required]" name="advisory_content" placeholder=""></textarea>
                            </div>
                            <br/>
                        </div>
                    </div>
                    <div class="form-group-">
                    <button type="button" class="btn btn-default btn-sm btn-block btn-info" onclick="send()">[{$languages.default.send_message|escape}]</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    
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
        var lat = [{$default_setting.lat->_value|escape}] || 10.778114;
        var lon = [{$default_setting.lon->_value|escape}] || 106.692965;
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
                              <div class="popheader cover" style="background-image:url([{$default_setting.balloon->_value|escape}])"></div>\
                              <div class="address">\
                                [A]:[{$default_setting.address->_value|escape}]<br/>\
                                [T]:[{$default_setting.tel->_value|escape}]<br/>\
                                [E]:[{$default_setting.email->_value|escape}]\
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
