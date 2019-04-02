var app = {}

app.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null) {
       return null;
    }
    return decodeURI(results[1]) || 0;
}
app.http = function(_option) {
    var option = {
        'url': null,
        'data': null,
        'datatype': "json",
        'method': "POST",
        'before': null,
        'after': null,
        'callback': null
    };
    if (_option)
        $.each(_option, function(index, value) {
            option[index] = value;
        });
    return {
        'call': function(_url, _data, _callback) {
            if (_url)
                option.url = _url;
            if (_data)
                option.data = _data;
            if (_callback)
                option.callback = _callback;
            if (typeof(option.before) === 'function')
                option.before();
            else {
                // pendingOn();
            }
            jQuery.ajax({
                type: option.method || 'POST',
                //cache:false,
                //timeout:10000,
                data: option.data,
                dataType: option.datatype,
                url: option.url,
                success: function(data_result) {
                    if (typeof(option.callback) === 'function')
                        option.callback(data_result);
                    if (typeof(option.after) === 'function')
                        option.after();
                    else {
                        // pendingOff();
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    if (typeof(option.after) === 'function')
                        option.after();
                    else {
                        // pendingOff();
                    }
                    addNotice('Sorry. Your request could not be completed. Please check your input data and try again.','danger');
                }
            });
        }
    };
}

app.search = function() {
    $('a[href="/project.html"]').click()
}
app.switch_search = function(page){
    $('#searchFrm').attr('action','/'+page)
}
app.init_search = function(){
    console.log('INIT')
    $('.selectpicker').each(function(){
        var placeholder = $(this).attr('placeholder');
        $(this).selectpicker({
            // liveSearchPlaceholder: placeholder
        });
    })
    var province_select = $('#province-cbx')
    var district_select = $('#district-cbx')
    var ward_select = $('#ward-cbx')
    province_select.on('change',function(){
        var selected_province_id = $(this).val();
        load_district(selected_province_id)
    })
    district_select.on('change',function(){
        var selected_district_id = $(this).val();
        load_ward(selected_district_id)
    })
    app.http({
        url: '/frontend/address/province',
        callback: function(res){
            var options = province_select.find('option:first-child')
            province_select.empty();
            province_select.append(options);
            res.data.map(function(item){
                var options = '<option value=' + item.id + '>' + item.name + '</option>';
                province_select.append(options);
            });
            if(app.urlParam('province')){
                province_select.val(app.urlParam('province')).trigger('change')
            }
            province_select.selectpicker('refresh');
        }
    }).call();
    function load_district(province_id){
        app.http({
            url: '/frontend/address/district/'+province_id,
            callback: function(res){
                var options = district_select.find('option:first-child')
                district_select.empty();
                district_select.append(options);
                res.data.map(function(item){
                    var options = '<option value=' + item.id + '>' + item.name + '</option>';
                    district_select.append(options);
                });
                if(app.urlParam('district')){
                    district_select.val(app.urlParam('district')).trigger('change')
                }
                district_select.selectpicker('refresh');
            }
        }).call();
    }
    function load_ward(district_id){
        app.http({
            url: '/frontend/address/ward/'+district_id,
            callback: function(res){
                var options = ward_select.find('option:first-child')
                ward_select.empty();
                ward_select.append(options);
                res.data.map(function(item){
                    var options = '<option value=' + item.id + '>' + item.name + '</option>';
                    ward_select.append(options);
                });
                if(app.urlParam('ward')){
                    ward_select.val(app.urlParam('ward')).trigger('change')
                }
                ward_select.selectpicker('refresh');
            }
        }).call();
    }

    // $.get('/frontend/address/province',function(res){

    // })
    // .selectpicker('refresh');
    // $("#dt").slider({});
}
app.toggleSearchAdvance = function(){
    $('.search-advance').toggle()
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
    this.content = content;
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
Popup.prototype.show = function() {
    // if (this.containerDiv.parentElement) {
        this.content.style.display = 'block'
    // }
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