$(document).ready(function(){
    $('img').error(function(){
        $(this).attr('src','/libraries/images/image_available.gif')
    })
    var owl = $('.owl-carousel');
    owl.owlCarousel({
        loop: true,
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
})