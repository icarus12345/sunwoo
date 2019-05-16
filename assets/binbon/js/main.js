var App = {
    addToCart: function(id){
        var data = {
            id: id,
            quantity: 1
        }
        App.submitToCart(data)
        
    },
    submitToCart: function(info){
        $.ajax({
            type: 'POST',
            //cache:false,
            //timeout:10000,
            data: info,
            dataType: 'json',
            url: '/frontend/cart/onAddToCart',
            success: function(res) {
                if(res.code==1){
                    toastr.success(res.message)
                    $('#cart').html(res.html)
                }else{
                    toastr.warning(res.message)
                }
                
            },
            error: function(xhr, ajaxOptions, thrownError) {
                
                toastr.warning('Sorry. Your request could not be completed. Please check your input data and try again.','Error !');
            }
        });
    },
    http: function(_option) {
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
                        alert('Sorry. Your request could not be completed. Please check your input data and try again.','danger');
                    }
                });
            }
        };
    }
}
$(document).ready(function(){
    $('img').error(function(){
        $(this).attr('src','/libraries/images/image_available.gif')
    })
    var owl = $('.owl-carousel[data-owlid]');
    if(owl.length>0) owl.owlCarousel({
        // loop: true,
        items: 1,
        thumbs: true,
        thumbImage: true,
        thumbContainerClass: 'owl-thumbs',
        thumbItemClass: 'owl-thumb-item'
    });

    var $grid = $('.grid').packery({
        // columnWidth: '.cell-sizer',
        // itemSelector: '.cell',
        // percentPosition: true
        gutter: 0,
        
    });
    $('#colorCbx').change(function(){
        var owlid = $(this).val()
        console.log(owlid,'owlid')
        if($('#product-thumbs .owl-carousel[data-owlid="'+owlid+'"]').length==0){
            owlid = 'unknown'
        }else{
            
        }
        $('#product-thumbs .owl-active').removeClass('owl-active')
        $('#product-thumbs .owl-carousel[data-owlid="'+owlid+'"]').addClass('owl-active')
    })
    $('#colorCbx,#sizeCbx,#materiaCbx').change(function(){
        var price_incurred = product_detail._data.price_incurred
        var colorid = $('#colorCbx').val();
        var sizeid = $('#sizeCbx').val();
        var materiaid = $('#materiaCbx').val();
        var color_incurred = +price_incurred[colorid]||0;
        var size_incurred = +price_incurred[sizeid]||0;
        var materia_incurred = +price_incurred[materiaid]||0;
        var total_incurred = color_incurred + size_incurred + materia_incurred;
        var price_no_discount = +product_detail._price + total_incurred
        var price_with_discount = +product_detail._discount + total_incurred
        $('.price-no-discount').html(price_no_discount + ' K')
        $('.price-with-discount').html(price_with_discount + ' K')
    })
    $('form').submit(function(event){
        var data = $(this).serializeJSON();
        App.submitToCart(data)
        event.preventDefault();
        event.stopPropagation();
        return false;
    })
    $('a').on('click','button',function(){
        event.preventDefault();
        event.stopPropagation();
        return false;
    })
    $('.snippet').each(function(){
        var minus = $(this).find('[data-type="minus"]');
        var plus = $(this).find('[data-type="plus"]');
        var input = $(this).find('input');
        minus.click(function(){
            var num = +input.val() || 0;
            num--;
            input.val(num)
        })
        plus.click(function(){
            var num = +input.val() || 0
            num++;
            input.val(num)
        })
    })
    if ($('a.swipebox').length > 0) {
        $('a.swipebox').swipebox({
            useCSS: true,
            callback:function(elm){
                 console.log(elm)
            }
        });
    }

    if ($('#owl-carousel-partner').length > 0) {
        $('#owl-carousel-partner').owlCarousel({
            loop:false,
            margin:10,
            nav:true,
            navText:['‹','›'],
            thumbs:false,
            responsive:{
                0:{
                    items:1
                },
                480:{
                    items:2
                },
                768:{
                    items:3
                },
                960:{
                    items:5
                },
                1200:{
                    items:6
                }
            }
        })
    }
    $('#gototop').click(function(){
        $("html, body").animate({ scrollTop: 0 }, "slow");
    })
    $(window).scroll(function(){
        var scroll = $(window).scrollTop();
        if(scroll){
            $('#gototop').stop(true).animate({
                bottom:10
            }, 500)
        }else{
            $('#gototop').stop(true).animate({
                bottom: -60
            },500)
        }
    })
})