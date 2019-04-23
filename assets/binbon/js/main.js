$(document).ready(function(){
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
})