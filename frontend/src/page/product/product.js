
jQuery(function () {
    jQuery("#variant-selector").change(function () {
        let url = jQuery("#variant-selector").children("option:selected").data('url')
        if (url != undefined && url != "") {
            window.location.href = url
        }
    });


    jQuery(".variant-selection").change(function () {
        let variantselection = jQuery("#variantSelection").data('variantselection')
        console.log(variantselection)
    });
});