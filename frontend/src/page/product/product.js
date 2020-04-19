
jQuery(function () {
    jQuery("#variant-selector").change(function () {
        let url = jQuery("#variant-selector").children("option:selected").data('url')
        if (url !== undefined && url !== "") {
            window.location.href = url
        }
    });
});