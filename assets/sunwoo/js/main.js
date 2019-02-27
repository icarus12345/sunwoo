var app = {}
app.search = function() {
    $('a[href="/project.html"]').click()
}
app.switch_search = function(page){
    $('#btn-search').attr('href','/'+page)
}
app.init_search = function(){
    $('.selectpicker').selectpicker();
}
function Popup(position, html) {
    this.position = position;
    var content = document.createElement('div')
    content.innerHTML = html
    content.classList.add('popup-bubble');

    // This zero-height div is positioned at the bottom of the bubble.
    var bubbleAnchor = document.createElement('div');
    bubbleAnchor.classList.add('popup-bubble-anchor');
    bubbleAnchor.appendChild(content);

    // This zero-height div is positioned at the bottom of the tip.
    this.containerDiv = document.createElement('div');
    this.containerDiv.classList.add('popup-container');
    this.containerDiv.appendChild(bubbleAnchor);

    // Optionally stop clicks, etc., from bubbling up to the map.
    google.maps.OverlayView.preventMapHitsAndGesturesFrom(this.containerDiv);
}
// ES5 magic to extend google.maps.OverlayView.
Popup.prototype = Object.create(google.maps.OverlayView.prototype);

/** Called when the popup is added to the map. */
Popup.prototype.onAdd = function() {
    this.getPanes().floatPane.appendChild(this.containerDiv);
};

/** Called when the popup is removed from the map. */
Popup.prototype.onRemove = function() {
    if (this.containerDiv.parentElement) {
        this.containerDiv.parentElement.removeChild(this.containerDiv);
    }
};

/** Called each frame when the popup needs to draw itself. */
Popup.prototype.draw = function() {
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

function Country(position) {
    this.position = position;
    var content = document.createElement('div')
    content.classList.add('country-bubble');

    // This zero-height div is positioned at the bottom of the bubble.
    var bubbleAnchor = document.createElement('div');
    bubbleAnchor.classList.add('country-bubble-anchor');
    bubbleAnchor.appendChild(content);

    // This zero-height div is positioned at the bottom of the tip.
    this.containerDiv = document.createElement('div');
    this.containerDiv.classList.add('country-container');
    this.containerDiv.appendChild(bubbleAnchor);

    // Optionally stop clicks, etc., from bubbling up to the map.
    google.maps.OverlayView.preventMapHitsAndGesturesFrom(this.containerDiv);
}
// ES5 magic to extend google.maps.OverlayView.
Country.prototype = Object.create(google.maps.OverlayView.prototype);

/** Called when the Country is added to the map. */
Country.prototype.onAdd = function() {
    this.getPanes().floatPane.appendChild(this.containerDiv);
};

/** Called when the Country is removed from the map. */
Country.prototype.onRemove = function() {
    if (this.containerDiv.parentElement) {
        this.containerDiv.parentElement.removeChild(this.containerDiv);
    }
};

/** Called each frame when the Country needs to draw itself. */
Country.prototype.draw = function() {
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
    app.init_search();
})