/* 
    Document   : realestate
    Created on : Mar 15, 2015, 10:47:49 PM
    Author     : Truong Khuong
    Description:
        Purpose of the javascript follows.
*/
var pending = 0;
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
function pendingOn(callback){
    if($('#pending').length==0)
        $('body').append('<div id="pending" class="spinner pending"></div>');
    $('#pending').show(500,function(){
        if(typeof callback == 'function')
            callback();
    });
    pending++;
}
function pendingOff(){
    pending--;
    if(pending==0) $('#pending').hide(500);
}
function dialogMsg(msg,tit){
    if(tit && tit != undefined)
        $('#dialogMsg .head').html(tit);
    $('#dialogMsg .body').html(msg);
    $('#dialogMsg').addClass('in')
}
function closeMsg(){
    $('#dialogMsg').removeClass('in')
}
function httpRequest(_option) {
    var option = {
        'url': null,
        'data': null,
        'datatype': "json",
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
                type: "POST",
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
                    dialogMsg('Sorry. Your request could not be completed. Please check your input data and try again.');
                }
            });
        }
    };
}
function dialog(elmid){
	var elm = document.getElementById(elmid);
	if(!$(elm).hasClass('in')){
		// $('.dialog').css({display:'none'});
		$('.dialog').removeClass('in');
		// elm.style.display='table';
		$(elm).addClass('in')
	}else{
		$(elm).removeClass('in')
		// elm.style.display='none';
	}
}
var imgbg = [
	'img/bg-a.jpg',
	'img/bg-b.jpg'
];
var nbg = 0;
function bgupdate(){
	setTimeout(function(){
		nbg++;
		if(nbg==imgbg.length) nbg=-1;
		$('body').animate({'background-image':'url('+imgbg[nbg]+')'},500);
		bgupdate();
	},3500);
}
$(document).ready(function(){
   	$("img.lazy").each(function() {
       	$(this).removeClass('lazy');
       	$(this.parentNode).nailthumb();
   	});
   	app.swipeProduct();
	intializePlayer();
	albumInit();
	if ($('#owl-demo').length > 0)
	$("#owl-demo").owlCarousel({
		autoPlay : 5000,
		stopOnHover : false,
		navigation:false,
		paginationSpeed : 1000,
		//goToFirstSpeed : 2000,
		singleItem : true,
		autoHeight : true,
		// transitionStyle:"fade"
	  });
});
var app = {
	'swipeProduct': function(){
		if ($('a.swipebox').length > 0) {
            $('a.swipebox').swipebox({
                useCSS: true,
                callback:function(elm){
                	 console.log(elm)
                }
            });
        }
	}
};
function intializePlayer(){
	var vid = document.getElementById("my_video")
	if(!vid) return;
	var playbtn = document.getElementById("pay-pause");
	var seekslider = document.getElementById("seekslider");
	vid.addEventListener("timeupdate", function () {
		var nt = vid.currentTime * (100 / vid.duration);
		seekslider.value = nt;
	}, false);
	playbtn.addEventListener("click", function () {
		if (vid.paused) {
			vid.play();
			$(playbtn).removeClass('fa-play').addClass('fa-pause');
		} else {
			vid.pause();
			$(playbtn).removeClass('fa-pause').addClass('fa-play');
		}
	}, false);
}
function centersync2(number) {
    var sync2 = $('#owl-thumb-gallery');
    var sync2visible = sync2.data('owlCarousel').owl.visibleItems;
    var num = number;
    var found = false;
    for (var i in sync2visible) {
        if (num === sync2visible[i]) {
            found = true;
            break;
        }
    }
    if (found === false) {
        if (num > sync2visible[sync2visible.length - 1]) {
            sync2.trigger('owl.goTo', num - sync2visible.length + 2);
        } else {
            if (num - 1 === -1) {
                num = 0;
            }
            sync2.trigger('owl.goTo', num);
        }
    } else if (num === sync2visible[sync2visible.length - 1]) {
        sync2.trigger('owl.goTo', sync2visible[1]);
    } else if (num === sync2visible[0]) {
        sync2.trigger('owl.goTo', num - 1);
    }
}

function albumInit() {
    if ($('#gallery').length > 0) {
        //$('#gallery img').parent().nailthumb({replaceAnimation :null});
        var sync1 = $('#gallery');
        var sync2 = $('#owl-thumb-gallery');
        sync1.owlCarousel({
            singleItem: true,
            navigation: false,
            pagination: false,
            lazyLoad: true,
            afterAction: function(el) {
                var current = this.currentItem;
                sync2
                    .find('.owl-item')
                    .removeClass('synced')
                    .eq(current)
                    .addClass('synced');
                if (sync2.data('owlCarousel') !== undefined) {
                    centersync2(current);
                }
            }

        });
        sync2.owlCarousel({
            items: 1,
            itemsCustom: [
                [0, 3],
                [450, 4],
                [640, 4],
                [960, 6],
            ],
            lazyLoad: true,
            navigation: true,
            navigationText: ['', ''],
            pagination: false,
            afterUpdate: function() {
                //$('.khung_thumb a img').width($('.synced').width() - 12 );
            },
            afterInit: function(el) {
                el.find('.owl-item').eq(0).addClass('synced');
            }
        })
        .on('click', '.owl-item', function(e) {
            e.preventDefault();
            var number = $(this).data('owlItem');
            sync1.trigger('owl.goTo', number);
        });


    }
}