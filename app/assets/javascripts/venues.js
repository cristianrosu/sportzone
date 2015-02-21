var ready = function() {

    $(".js-view-more").on("click", function(){
        $(this).siblings('.js-venue-other-info').toggleClass('hidden');
        $(this).find('i').toggleClass('glyphicon-menu-up text-primary');
    });
}


$('document').ready(ready);
/* Page load is what turbo links will trigger. */
$(document).on('page:load', ready);