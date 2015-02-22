var ready = function() {
    $('.chosen-select').chosen({
        no_results_text: 'No results matched'
    });
}

$('document').ready(ready);
/* Page load is what turbo links will trigger. */
$(document).on('page:load', ready);
