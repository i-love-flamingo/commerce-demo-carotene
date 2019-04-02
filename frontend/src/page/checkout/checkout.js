
jQuery(function () {
    jQuery("#useBillingAddress").change(function () {
        if (jQuery("#useBillingAddress").prop('checked')) {
            jQuery("#useBillingAddressToggle").collapse("hide")
        }
        jQuery("#useBillingAddressToggle").collapse("show")
    });
});