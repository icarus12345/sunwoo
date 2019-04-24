var App = {
    addToCart: function(info){
        $.ajax({
            type: 'POST',
            //cache:false,
            //timeout:10000,
            data: info,
            dataType: 'json',
            url: '/frontend/cart/onAddToCart',
            success: function(res) {
                alert(res.message)
            },
            error: function(xhr, ajaxOptions, thrownError) {
                
                alert('Sorry. Your request could not be completed. Please check your input data and try again.','danger');
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
    var owl = $('.owl-carousel');
    owl.owlCarousel({
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
        App.addToCart(data)
        event.preventDefault();
        event.stopPropagation();
        return false;
    })
})