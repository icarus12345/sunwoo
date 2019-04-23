if (typeof String.prototype.repeater !== 'function') {
    String.prototype.repeater = function(count) {
        var a = "";
        for (x = 0; x < count; x++) {
            a += this
        }
        return a
    };
}
$.fn.serializeObject = function() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};
if (typeof String.prototype.endsWith !== 'function') {
    String.prototype.endsWith = function(str) {
        return this.slice(-str.length) === str;
    };
}
if (typeof String.prototype.startsWith !== 'function') {
    // see below for better implementation!
    String.prototype.startsWith = function(str) {
        return this.indexOf(str) === 0;
    };
}

var pending = 0, notices=[], base_url = '/';

function toggleSidebar(){
    $('body').toggleClass('full-content');
}
function toggleContent(){
    $('#container .content').toggleClass('in');
}
function toggleQuickBar(){
    $('#quick-bar').toggleClass('in');
}
function pendingOn(callback){
    if($('#pending').length==0)
        $('body').append('<div id="pending" class="pending">waiting...</div>');
    $('#pending').stop().show(500,function(){
            if(typeof callback == 'function')callback();
        });
    pending++;
}
function pendingOff(){
    pending--;
    if(pending==0) $('#pending').stop().hide(500);
}
function addNotice(message, type, stick){
    if(type == undefined) type = '';
    var notice = {};
    var now = new Date();
    var dateTime = now.format("dd/mm/yyyy h:MM:ss TT");
    notice.message = $(
        '<div class="alert ' + type + '">' +
            '<div class="time">' +
                dateTime +
                '<span class="pull-right" aria-hidden="true" data-dismiss="alert">×</span>' +
            '</div>' +
            message +
        '</div>'
    );
    if($('.notices').length==0)
        $('body').append('<div class="notices"><p class="btn btn-default btn-xs" onclick="closeAllNotice()">Close all message</p><div></div></div>');
    $('.notices>div').prepend(notice.message);
    if($('.notices>div>div').length>1) $('.notices>.btn').show();
    else $('.notices>.btn').hide();
    if(type == 'info'){
        if( !stick ){
            setTimeout(function(){closeNotice(notice.message)}, 5000)
            return;
        }
    }
    if(stick != undefined && stick !== true){
        setTimeout(function(){closeNotice(notice.message)}, 5000)
    }
}
function closeNotice(notice){
    notice.remove();
    if($('.notices>div>div').length>1) $('.notices>.btn').show();
    else $('.notices>.btn').hide();
}
function closeAllNotice(){
    $('.notices>div>div').remove();
    if($('.notices>div>div').length>1) $('.notices>.btn').show();
    else $('.notices>.btn').hide();
}
function uidialog(_option) {
    var me = this;
    this.option = {
        'modal': true,
        'type': "notice", //notice,error,question,custom
        'title': null,
        'message': "",
        'uidialog': null,
        'hideclose': false,
        'autoOpen': false,
        'minwidth': '320px',
        'width': 'auto',
        'height': 'auto',
        'dialogClass': '',
        'onload': null,
        'onclose': null,
        'onopen': null,
        'callback': null,
        'buttons': null
    };
    var option = this.option;
    if (_option) {
        $.each(_option, function(index, value) {
            option[index] = value;
        });
        this.option = option;
    }
    option.title = "<div class='ui-" + option.type + "'>" + (option.title === null ? "Notice Message !" : option.title) + "</div>";
    if (option.message === null || option.message === undefined) {
        
    } else if (typeof(option.message) === "object") {
        option.uidialog = option.message;
    } else {
        if (option.uidialog == null) {
            var node = 1;
            var $div = $('.ui-dialog-' + node);
            while ($div.length > 0 && !$div.is(":hidden")) {
                node++;
                $div = $('.ui-dialog-' + node);
            }
            if ($div.length === 0) {
                option.uidialog = $('<div/>', {
                    'class': 'ui-dialog-' + node
                }).appendTo($('body'));
            }else option.uidialog = $div;
        }
        if (typeof(option.message) === "string") {
            option.buttons = {
                Close: function() {
                    $(this).dialog("destroy");
                }
            };
            option.uidialog.html('<div style="max-width:320px">' + option.message + '</div>');
        } else {
            //option.uidialog = $("#bckdialog");
            option.uidialog.html("Unkown this message !");
        }
    }
    return {
        'open': function(str) {
            if (str) {
                option.uidialog.html('<div>' + str + '</div>');
                option.buttons = {
                    'Close': function() {
                        $(this).dialog("destroy");
                    }
                };
            }
            option.uidialog.dialog({
                'modal': option.modal,
                /*autoOpen        : option.autoOpen,*/
                'minwidth': option.minwidth,
                'dialogClass': option.dialogClass,
                'resizable': false,
                'width': option.width,
                'title': option.title,
                'closeOnEscape': true,
                /*hide                : "explode",*/
                'buttons': option.buttons,
                'open': function(event, ui) {
                    if (option.onopen && typeof(option.onopen) === "function") {
                        try {
                            option.onopen();
                        } catch (e) {}
                    }
                    $(event.target).dialog('widget')
                        .css({
                            'position': 'fixed'
                        })
                        .position({
                            'my': 'center',
                            'at': 'center',
                            'of': window
                        });
                },
                'close': function(event, ui) {
                    if (option.onclose && typeof(option.onclose) === "function") {
                        try {
                            option.onclose();
                        } catch (e) {}
                    }
                },
                'create': function() {
                    if (option.hideclose === true) {
                        $(this).closest(".ui-dialog")
                            .find(".ui-dialog-titlebar-close")
                            .hide();
                    }
                }
            });
        },
        'close': function() {
            option.uidialog.dialog('close');
        }
    };
}
function ConfirmMsg(title, message, callback) {
    if ($("#confirm-dialog").length === 0) {
        $('body').append('<div id="confirm-dialog">'+message+'</div>');
    }
    uidialog({
        'message' : $('#confirm-dialog'),
        'title': title,
                'width':'320px',
        'type':'confirm',
        'buttons' : [{
            'text': 'Confirm',
            'class': 'ui-btn',
            'click': function() {
                if(typeof callback == 'function') callback();
                $(this).dialog("close");
            }
        }, {
            'text': 'Cancel',
            'class': 'ui-btn',
            'click': function() {
                $(this).dialog("close");
            }
        }]
    }).open();
}
function httpRequest(_option) {
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
                pendingOn();
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
                        pendingOff();
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    if (typeof(option.after) === 'function')
                        option.after();
                    else {
                        pendingOff();
                    }
                    addNotice('Sorry. Your request could not be completed. Please check your input data and try again.','danger');
                }
            });
        }
    };
}
function AliasTo(from, element) {
    var str = $(from).val();
    str = str.replace(/^\s+|\s+$/g, ''); // trim
    str = str.toLowerCase();

    // remove accents, swap ñ for n, etc

    var from = "àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ·/_,:;";
    var to = "aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyd-/_,:;";
    //var from = "àáäâèéëêìíïîòóöôùúüûñç·/_,:;";
    //var to   = "aaaaeeeeiiiioooouuuunc------";
    for (var i = 0, l = from.length; i < l; i++) {
        str = str.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i));
    }

    str = str.replace(/[^a-z0-9 -]/g, '') // remove invalid chars
    .replace(/\s+/g, '-') // collapse whitespace and replace by -
    .replace(/-+/g, '-'); // collapse dashes

    $(element).val(str);
}
//////
//// KCFINDER - START
//
function BrowseServerCallBack(callback) {
    try {
        window.KCFinder = {};
        window.KCFinder.callBack = function(url) {
            window.KCFinder = null;
            callback(url);
        };
        window.open(base_url + 'libraries/kcfinder/browse.php?lang=en', 'kcfinder_textbox',
            'status=0, toolbar=0, location=0, menubar=0, directories=0, resizable=1, scrollbars=0, width=700, height=500'
        );
    } catch (e) {
        addNotice(e.message,'danger');
    }
}

function openKCFinderByPath(path, element) {
    if ($(element).length === 0) {
        addNotice("Input element is not exist.",'danger');
        return;
    }
    try {
        window.KCFinder = {};
        window.KCFinder.callBack = function(url) {
            window.KCFinder = null;
            $(element).val(url);
        };
        window.open(base_url + 'libraries/kcfinder/browse.php?lang=en&' + path, 'kcfinder_textbox',
            'status=0, toolbar=0, location=0, menubar=0, directories=0, resizable=1, scrollbars=0, width=700, height=500'
        );
    } catch (e) {
        addNotice(e.message,'danger');
    }

}

function openKCFinderMulti(callback) {
    window.KCFinder = {
        callBackMultiple: function(files) {
            window.KCFinder = null;
            callback(files);
        }
    };
    window.open(base_url + 'libraries/kcfinder/browse.php?lang=en',
        'kcfinder_multiple', 'status=0, toolbar=0, location=0, menubar=0, ' +
        'directories=0, resizable=1, scrollbars=0, width=800, height=600'
    );
}

function openKCFinderMultiByPath(path, callback) {
    window.KCFinder = {
        callBackMultiple: function(files) {
            window.KCFinder = null;
            callback(files);
        }
    };
    window.open(base_url + 'libraries/kcfinder/browse.php?lang=en&' + path,
        'kcfinder_multiple', 'status=0, toolbar=0, location=0, menubar=0, ' +
        'directories=0, resizable=1, scrollbars=0, width=800, height=600'
    );
}
function BrowseServer(elementid) {
    if ($(elementid).length === 0){
        addNotice('Input element is not exist','danger');
        return;
    }
    try {
        window.KCFinder = {};
        window.KCFinder.callBack = function(url) {
            window.KCFinder = null;
            $(elementid).val(url);
            $(elementid).focus();
        };
        window.open(base_url + 'libraries/kcfinder/browse.php?lang=vi&type=image', 'kcfinder_textbox',
            'status=0, toolbar=0, location=0, menubar=0, directories=0, resizable=1, scrollbars=0, width=700, height=500'
        );
    } catch (e) {
        addNotice(e.message,'danger');
    }
}
//////
//// END
//
//////
//// CKEDITOR START
//


function addRedactorEditor(Element) {
    Element.redactor({
        //air: true,
        //wym: true,
        'buttons': ['html', 'formatting', '|', 'bold', 'italic', 'deleted', '|', 'unorderedlist', 'orderedlist', 'outdent', 'indent', 'alignment', '|', 'video', 'link', '|', 'fontcolor', 'backcolor']
        //plugins: ['advanced']
    });
}

function addEditorFeature(ElementID, height) {
//    var instance = CKEDITOR.instances[ElementID];
//    if (instance) {
//        return;
//    }
    if(typeof height == 'undefined') height = 320
    try {
        CKEDITOR.config.startupFocus = false;
        CKEDITOR.replace(ElementID, {
            'height': height,
            'toolbar': [
                ['Source'], ['Preview', 'Templates'],
                ['Image', 'Youtube','Video'], ['Flash', 'Table'],
                ['HorizontalRule', 'Smiley', 'SpecialChar'], ['PageBreak', 'Iframe'],
                ['Bold', 'Italic'], ['Underline', 'Strike'],
                ['Subscript', 'Superscript'],
                ['NumberedList', 'BulletedList'], ['Outdent', 'Indent'],
                ['Blockquote', 'CreateDiv'],
                ['JustifyLeft', 'JustifyCenter'], ['JustifyRight', 'JustifyBlock'],
                ['BidiLtr', 'BidiRtl', 'Language'],
                ['Link', 'Unlink'],
                /*['Styles'], */
                ['Format'], ['Font'], ['FontSize'],
                ['TextColor', 'BGColor'],['RemoveFormat'],
                ['Maximize', 'ShowBlocks']
                
            ],
            'removePlugins': 'magicline'

        });
    } catch (e) {
        addNotice(e.message,'danger');
    }

}

function addEditorBasic(ElementID, height) {
//    var instance = CKEDITOR.instances[ElementID];
//    if (instance) {
//        return;
//    }
    if(typeof height == 'undefined') height = 320
    try {
        CKEDITOR.config.startupFocus = false;
        CKEDITOR.replace(ElementID, {
            'height': height,
            'toolbar': [
                ['ShowBlocks', 'Image'],
                ['NumberedList', 'BulletedList'],['Outdent', 'Indent'],['Link', 'Unlink'],
                ['JustifyLeft', 'JustifyCenter'], ['JustifyRight', 'JustifyBlock'],
                ['Format'], ['TextColor', 'BGColor']
            ],
            'removePlugins': 'magicline'
        });
    } catch (e) {
        addNotice(e.message,'danger');
    }
}

function removeEditor(EId) {
    var instance = CKEDITOR.instances[EId];
    if (instance) {
        //CKEDITOR.remove(instance);
        instance.destroy(true);
    }
    //CKEDITOR.replace(EId);
}
//////
//// END
//
var cms = {};
cms.callLogMessage = function(){
    $('.mark-body').show();
    var date = $('#datetimepicker').data("DateTimePicker").getDate().format('YYYY/MM/DD')
    pendingOn(function(){
        $('.message-dropdown .log-errors').load(
            '/cms/excution/logquery/'+date,
            {'e':$('#e_type').val()},
            pendingOff
        );
    });
};
cms.logMessage = function(){
    
    if(!$('.message-dropdown').hasClass('open')){
        $('.message-dropdown').addClass('open');
        if($('.message-dropdown').is(":visible")){
            cms.callLogMessage();
        }
    }else{
        $('.message-dropdown').removeClass('open');
        $('.mark-body').hide();
    }
};
function toggleLeftBar(){
    $('body').toggleClass('is-bar')
}
function toggleEntry(){
    $('body').toggleClass('is-entry')
}
function getNewPass(){
    var str = Math.random().toString(36).substring(10);
    document.myinfoForm.ause_password.value = str;
}
function accountdialog() {
    if ($("#iDialog").length === 0) {
        $('body').append('<div id="iDialog"></div>');
    }
    $('#myinfoForm').validationEngine({'scroll': false});
    uidialog({
        'message' : $('#iDialog'),
        'title': 'Account information !',
        'width':'320px',
        'type':'notice',
        'buttons' : [{
            'text': 'Update',
            'class': 'ui-btn',
            'click': function() {
                if( $('#myinfoForm').validationEngine('validate') === false)return false;
                var Params = $('#myinfoForm').serializeObject();
                httpRequest({
                    'url': base_url+'cms/excution/updateinfo',
                    'data': {
                        'Params': Params
                    },
                    'callback': function(rsdata) {
                        if (rsdata.result < 0) {
                            addNotice(rsdata.message,'danger');
                        } else {
                            addNotice(rsdata.message,'info');
                            $('#iDialog').dialog("close");
                        }
                    }
                }).call();
                
            }
        },{
            'text': 'Cancel',
            'class': 'ui-btn',
            'click': function() {
                $(this).dialog("close");
            }
        }]
    }).open();
}
$(document).ready(function(){
    // $('#iEntry,#iEntryList').css({'overflow-y':'auto'});
    $('body').uitooltip({
        items: ".tool-tip",
        // track: true,
        position: {
            my: "center bottom-5",
            at: "center top",
            using: function(position, feedback) {
                $(this).css(position);
                if ($(this).find('.arrow').length === 0) {
                    $("<div>")
                            .addClass("arrow")
                            .addClass(feedback.vertical)
                            .addClass(feedback.horizontal)
                            .appendTo(this);
                }
            }
        }
        
    });
    
    $('.mark-body').click(function(){
        $(this).hide();
        $('.message-dropdown').removeClass('open');
    });
    $('.navbar-toggle').click(toggleLeftBar);
    $('#datetimepicker').datetimepicker({
        'pickDate': true,
        'pickTime': false   ,
        'dayOfWeekStart': 1
    });
    $('#e_type').change(cms.callLogMessage);
    $("#datetimepicker").on("dp.change",cms.callLogMessage);
    if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
        $("#iLeftBar>.navigation-menu,.iMessage").css({
            'overflow-y':'auto',
            'overflow-x':'hidden'
        })
        accordionMenu();
    }else{
        // $("#jquery-accordion-menu").jqueryAccordionMenu();
        accordionMenu();
        $("#iLeftBar>.navigation-menu,.iMessage")
            .mCustomScrollbar({
                axis:"y", autoHideScrollbar: true,
                //'scrollInertia':0,
                theme:"minimal-dark"
            });
    }
});
function accordionMenu(){
    $('#jquery-accordion-menu a').each(function(){
        if($(this).next().is('ul')){
            $(this).append('<span class="submenu-indicator">+</span>');
            $(this).click(function(){
                if($(this).hasClass('submenu-indicator-minus')){
                    $(this).removeClass('submenu-indicator-minus');
                    $(this).next().fadeOut(200);
                }else{
                    //$(this).parent().parent().find('>li>a.submenu-indicator-minus').next().fadeOut(200);
                    //$(this).parent().parent().find('>li>a.submenu-indicator-minus').removeClass('submenu-indicator-minus');
                    $(this).addClass('submenu-indicator-minus');
                    $(this).next().fadeIn(200);
                }
            });
        }
    })
}
var App = {}
App.SeeGoogleMap = function(mapElement){
    // google.maps.event.addDomListener(window, 'load', function(){

        //
        var lat = +$(mapElement).data('lat') || 10.7546664;
        var lon = +$(mapElement).data('lon') || 106.415041;
        // Basic options for a simple Google Map
        // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
        var mapOptions = {
            zoom: 14,
            center: new google.maps.LatLng(lat, lon),
        };
        // Get the HTML DOM element that will contain your map 
        // We are using a div with id="map" seen below in the <body>
        // Create the Google Map using our element and options defined above
        var map = new google.maps.Map(mapElement, mapOptions);
        var marker = new google.maps.Marker({
                position: new google.maps.LatLng(lat, lon),
                map: map
            });

    // });
}
App.AddGoogleMap = function(mapElement,callback){
    // google.maps.event.addDomListener(window, 'load', function(){

        var lat = +$(mapElement).data('lat') || 10.7546664;
        var lon = +$(mapElement).data('lon') || 106.415041;
        // var latlon = [ 10.771921, 106.678296 ]; // 151.20929550000005&lat=-33.8688197
        // var lat  = latlon[0], lon = latlon[1];
        // Basic options for a simple Google Map
        // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
        var mapOptions = {
            zoom: 14,
            center: new google.maps.LatLng(lat, lon),
        };
        // Get the HTML DOM element that will contain your map 
        // We are using a div with id="map" seen below in the <body>
        // Create the Google Map using our element and options defined above
        var map = new google.maps.Map(mapElement, mapOptions);
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(lat, lon),
            map: map,
            draggable:true,

        });
        if(typeof callback == 'function'){
            // google.maps.event.addListener(marker,'drag',callback);
            google.maps.event.addListener(marker,'dragend',callback);
            // marker.addListener('drag', callback);
            // marker.addListener('dragend', callback);
            google.maps.event.addListener(map,'click',function(e){
                marker.setPosition(e.latLng)
                callback(e)
            });
            // https://maps.googleapis.com/maps/api/geocode/json?latlng=10.759171651626405,106.42599052008768&sensor=false&key=AIzaSyBWqKci2rs1gaHG2PlcHjpMqef3XiQiJOw
        }
    // });
}
App.getAddress = function(lat,lon,callback){
    //
    httpRequest({
        'url': 'https://maps.googleapis.com/maps/api/geocode/json',
        'method':'GET',
        'data': {
            latlng:lat+','+lon,
            sensor:'false',
            key: 'AIzaSyBWqKci2rs1gaHG2PlcHjpMqef3XiQiJOw'
        },
        'callback': function(rsdata) {
            callback(rsdata)
        }
    }).call();
}
App.InitForm = function(frm){
    frm.validationEngine({
        'scroll': false,
        'isPopup' : true,
        validateNonVisibleFields:true
    });
    frm.find('.selectpicker').selectpicker();
    frm.find('.date-picker').get().map(function(elm){
        $(elm).datetimepicker({
            format: 'YYYY-MM-DD'
        });
    });
    frm.find('.date-time-picker').get().map(function(elm){
        $(elm).datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss'
        });
    });
    if(frm.find('textarea[data-editor]').length>0){
        frm.find('textarea[data-editor]').each(function(){
                // addEditorBasic($(this).attr('id'),160);
                App.Editor.addEditorFeature($(this).attr('id'),200);
        })
        
    }
    if($('[data-role="sortable"]').length > 0){

        $('[data-role="sortable"]').sortable({placeholder: "ui-state-highlight"});
        $('[data-role="sortable"]').disableSelection();
    }
    
    setTimeout(function(){
        frm.find('[data-googlemap]').get().map(function(elm){
            App.AddGoogleMap(elm,function(e){
                frm.find('input[name="'+$(elm).data('latcolumn')+'"]').val(e.latLng.lat());
                frm.find('input[name="'+$(elm).data('loncolumn')+'"]').val(e.latLng.lng());
                frm.find('span[data-latlonpreview="'+$(elm).data('latcolumn')+$(elm).data('loncolumn')+'"]').text(e.latLng.lat() + ' ' + e.latLng.lng());
            })
        })
    },500)
}
App.InitSee = function(frm){
    setTimeout(function(){
        frm.find('[data-googlemap]').get().map(function(elm){
            App.SeeGoogleMap(elm)
        })
    },500)

}

//////
//// CKEDITOR START
//

App.Editor = {}
App.Editor.addRedactorEditor = function(Element) {
    Element.redactor({
        //air: true,
        //wym: true,
        'buttons': ['html', 'formatting', '|', 'bold', 'italic', 'deleted', '|', 'unorderedlist', 'orderedlist', 'outdent', 'indent', 'alignment', '|', 'video', 'link', '|', 'fontcolor', 'backcolor']
        //plugins: ['advanced']
    });
}

App.Editor.addEditorFeature = function(ElementID, height) {
//    var instance = CKEDITOR.instances[ElementID];
//    if (instance) {
//        return;
//    }
    if(typeof height == 'undefined') height = 320
    try {
        CKEDITOR.config.startupFocus = false;
        CKEDITOR.replace(ElementID, {
            'height': height,
            'toolbar': [
                ['Source'], ['Preview', 'Templates'],
                ['Image', 'Youtube','Video'], ['Flash', 'Table'],
                ['HorizontalRule', 'Smiley', 'SpecialChar'], ['PageBreak', 'Iframe'],
                ['Bold', 'Italic'], ['Underline', 'Strike'],
                ['Subscript', 'Superscript'],
                ['NumberedList', 'BulletedList'], ['Outdent', 'Indent'],
                ['Blockquote', 'CreateDiv'],
                ['JustifyLeft', 'JustifyCenter'], ['JustifyRight', 'JustifyBlock'],
                ['BidiLtr', 'BidiRtl', 'Language'],
                ['Link', 'Unlink'],
                /*['Styles'], */
                ['Format'], ['Font'], ['FontSize'],
                ['TextColor', 'BGColor'],['RemoveFormat'],
                ['Maximize', 'ShowBlocks']
                
            ],
            'removePlugins': 'magicline'

        });
        CKEDITOR.instances[ElementID].on('change', function() { CKEDITOR.instances[ElementID].updateElement() });
    } catch (e) {
        toastr.error(e.message,'Error');
    }

}

App.Editor.addEditorBasic = function (ElementID, height) {
//    var instance = CKEDITOR.instances[ElementID];
//    if (instance) {
//        return;
//    }
    if(typeof height == 'undefined') height = 320
    try {
        CKEDITOR.config.startupFocus = false;
        CKEDITOR.replace(ElementID, {
            'height': height,
            'toolbar': [
                ['ShowBlocks', 'Image'],
                ['NumberedList', 'BulletedList'],['Outdent', 'Indent'],['Link', 'Unlink'],
                ['JustifyLeft', 'JustifyCenter'], ['JustifyRight', 'JustifyBlock'],
                ['Format'], ['TextColor', 'BGColor']
            ],
            'removePlugins': 'magicline'
        });
        CKEDITOR.instances[ElementID].on('change', function() { CKEDITOR.instances[ElementID].updateElement() });
    } catch (e) {
        toastr.error(e.message,'Error');
    }
}

App.Editor.removeEditor = function (EId) {
    var instance = CKEDITOR.instances[EId];
    if (instance) {
        //CKEDITOR.remove(instance);
        instance.destroy(true);
    }
    //CKEDITOR.replace(EId);
}
//////
//// END
//

//////
//// KCFINDER - START
//
App.KCFinder={}
App.KCFinder.BrowseServerCallBack = function (callback) {
    try {
        window.KCFinder = {};
        window.KCFinder.callBack = function(url) {
            window.KCFinder = null;
            callback(url);
            $('#kc-finder-popup .kc-finder-content').html('');
            $('#kc-finder-popup').hide();
        };
        
        if($('#kc-finder-popup').length==0){
            window.open(App.BaseUrl + 'lib/kcfinder/browse.php?lang=en', 'kcfinder_textbox',
                'status=0, toolbar=0, location=0, menubar=0, directories=0, resizable=1, scrollbars=0, width=700, height=500'
            );;
        }else{
            $('#kc-finder-popup .kc-finder-content').html('<iframe name="kcfinder_iframe" src="'+App.BaseUrl + 'lib/kcfinder/browse.php?lang=en" style="width:100%;height:100%;position:absolute;top:0;left:0;border:0;margin:0;padding:0"/>')
            $('#kc-finder-popup').show();
        }
    } catch (e) {
        toastr.error(e.message,'Error');
    }
}

App.KCFinder.openKCFinderByPath = function (path, element) {
    if ($(element).length === 0) {
        addNotice("Input element is not exist.",'error');
        return;
    }
    try {
        window.KCFinder = {};
        window.KCFinder.callBack = function(url) {
            window.KCFinder = null;
            $(element).val(url);
            $('#kc-finder-popup .kc-finder-content').html('');
            $('#kc-finder-popup').hide();
        };
        
        if($('#kc-finder-popup').length==0){
            window.open(App.BaseUrl + 'lib/kcfinder/browse.php?lang=en&' + path, 'kcfinder_textbox',
                'status=0, toolbar=0, location=0, menubar=0, directories=0, resizable=1, scrollbars=0, width=700, height=500'
            );
        }else{
            $('#kc-finder-popup .kc-finder-content').html('<iframe name="kcfinder_iframe" src="'+App.BaseUrl + 'lib/kcfinder/browse.php?lang=en'+path+'" style="width:100%;height:100%;position:absolute;top:0;left:0;border:0;margin:0;padding:0"/>')
            $('#kc-finder-popup').show();
        }
    } catch (e) {
        toastr.error(e.message,'Error');
    }

}

App.KCFinder.openKCFinderMulti = function (callback) {
    window.KCFinder = {
        callBackMultiple: function(files) {
            window.KCFinder = null;
            callback(files);
            $('#kc-finder-popup .kc-finder-content').html('');
            $('#kc-finder-popup').hide();
        }
    };
    
    if($('#kc-finder-popup').length==0){
        window.open(App.BaseUrl + 'lib/kcfinder/browse.php?lang=en',
            'kcfinder_multiple', 'status=0, toolbar=0, location=0, menubar=0, ' +
            'directories=0, resizable=1, scrollbars=0, width=800, height=600'
        );
    }else{
        $('#kc-finder-popup .kc-finder-content').html('<iframe name="kcfinder_iframe" src="'+App.BaseUrl + 'lib/kcfinder/browse.php?lang=en" style="width:100%;height:100%;position:absolute;top:0;left:0;border:0;margin:0;padding:0"/>')
        $('#kc-finder-popup').show();
    }
}

App.KCFinder.openKCFinderMultiByPath = function (path, callback) {
    window.KCFinder = {
        callBackMultiple: function(files) {
            window.KCFinder = null;
            callback(files);
            $('#kc-finder-popup .kc-finder-content').html('');
            $('#kc-finder-popup').hide();
        }
    };
    
    if($('#kc-finder-popup').length==0){
        window.open(App.BaseUrl + 'lib/kcfinder/browse.php?lang=en&' + path,
            'kcfinder_multiple', 'status=0, toolbar=0, location=0, menubar=0, ' +
            'directories=0, resizable=1, scrollbars=0, width=800, height=600'
        );
    }else{
        $('#kc-finder-popup .kc-finder-content').html('<iframe name="kcfinder_iframe" src="'+App.BaseUrl + 'lib/kcfinder/browse.php?lang=en&' + path +'" style="width:100%;height:100%;position:absolute;top:0;left:0;border:0;margin:0;padding:0"/>')
        $('#kc-finder-popup').show();
    }
}
App.KCFinder.BrowseServer = function (elementid) {
    if ($(elementid).length === 0){
        toastr.error('Input element is not exist','Error');
        return;
    }
    var div = document.getElementById('kc-finder-popup');
    if ($("#kc-finder-dialog").length === 0) {
        $('body').append('<div id="kc-finder-dialog"><div style="padding-bottom:64.42%"></div></div>');
    }
    new App.Dialog({
        'message' : $('#kc-finder-dialog'),
        'title': '<h4>KCFinder <small>Image browser</small></h4>',
        'dialogClass':'',
        'width':'720px',
        'type':'notice',
        // 'hideclose':true,
        'closeOnEscape':false
    }).open();
    try {
        window.KCFinder = {};
        window.KCFinder.callBack = function(url) {
            window.KCFinder = null;
            $(elementid).val(url);
            $(elementid).focus();
            $('#kc-finder-dialog>div').html('');
            $('#kc-finder-dialog').dialog('close')
        };
        if($('#kc-finder-dialog').length==0){
            window.open(App.BaseUrl + 'lib/kcfinder/browse.php?lang=en', 'kcfinder_textbox',
                'status=0, toolbar=0, location=0, menubar=0, directories=0, resizable=1, scrollbars=0, width=700, height=500'
            );
        }else{
            $('#kc-finder-dialog>div').html('<iframe name="kcfinder_iframe" src="'+App.BaseUrl + 'lib/kcfinder/browse.php?lang=en'+'" style="width:100%;height:100%;position:absolute;top:0;left:0;border:0;margin:0;padding:0"/>')
        }
    } catch (e) {
        toastr.error(e.message,'Error');
    }
}
App.SEO = function(type,head_id){
    if ($("#seo-dialog").length === 0) {
        $('body').append('<div id="seo-dialog"><div style="padding:40px">Loading...</div></div>');
    }
    httpRequest({
        'url'         :  base_url + 'cms/cp/seo/editpanel/'+type,
        'data'        :   {
            'head_id'  :   head_id
        },
        'callback'    :   function(rsdata){
            if(rsdata.result<0){
                addNotice(rsdata.message,'danger');
            }else{
                $('#seo-dialog').html(rsdata.htmlreponse);
                $('#seoform').validationEngine({'scroll': false});
            }
        }
    }).call();
    uidialog({
        'message' : $('#seo-dialog'),
        'title': 'SEO information !',
        'width':'480px',
        'type':'notice',
        'buttons' : [{
            'text': 'Update',
            'class': 'ui-btn',
            'click': function() {
                if( $('#seoform').validationEngine('validate') === false)return false;
                var Params = $('#seoform').serializeObject();
                var Id = $('#seoEntryId').val();
                httpRequest({
                    'url': base_url+'cms/cp/seo/oncommit',
                    'data': {
                        "Id":Id,
                        'Params': Params
                    },
                    'callback': function(rsdata) {
                        if (rsdata.result < 0) {
                            addNotice(rsdata.message,'danger');
                        } else {
                            addNotice(rsdata.message,'info');
                            $('#seo-dialog').dialog("close");
                        }
                    }
                }).call();
                
            }
        },{
            'text': 'Cancel',
            'class': 'ui-btn',
            'click': function() {
                $(this).dialog("close");
            }
        }]
    }).open();
}
App.PhotoBook = {
    'add': function(elmid){
        var prefix = $(elmid).data('prefix');
        openKCFinderMulti(function(files){
            for(var i in files){
                $(elmid).append(
                    '<li class="ui-state-default">'+
                        '<img class="thumb" src="'+files[i]+'"/>'+
                        '<div class="action cursor" title="Delete this photo" onclick="App.PhotoBook.delete(this)">'+
                            '<i class="fa fa-trash-alt"></i>'+
                            '<input type="hidden" name="'+prefix+'" value="'+files[i]+'"/>'+
                        '</div>'+
                    '</li>'
                );
            }
        })
    },
    'delete': function(elm){
        $(elm).parents('li.ui-state-default').hide(500,function(){$(this).remove()});
    }
}
//////
//// END
//