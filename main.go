package main

import (
	"flamingo.me/dingo"
	//"flamingo.me/flamingo-commerce-adapter-magento2/magento2"

	// "flamingo.me/flamingo-commerce-adapter-magento2/magento2"
	"flamingo.me/flamingo-commerce-adapter-standalone/csvcommerce"
	"flamingo.me/flamingo-commerce-adapter-standalone/productSearch"
	"flamingo.me/flamingo-commerce/v3/cart"
	"flamingo.me/flamingo-commerce/v3/category"
	"flamingo.me/flamingo-commerce/v3/checkout"
	"flamingo.me/flamingo-commerce/v3/customer"
	"flamingo.me/flamingo-commerce/v3/payment"
	"flamingo.me/flamingo-commerce/v3/price"
	"flamingo.me/flamingo-commerce/v3/product"
	"flamingo.me/flamingo/v3"
	"flamingo.me/flamingo/v3/core/healthcheck"
	"flamingo.me/flamingo/v3/core/locale"
	"flamingo.me/flamingo/v3/core/oauth"
	"flamingo.me/flamingo/v3/core/requestlogger"
	"flamingo.me/flamingo/v3/framework/config"
	flamingoFramework "flamingo.me/flamingo/v3/framework/flamingo"
	"flamingo.me/flamingo/v3/framework/opencensus"
	"flamingo.me/flamingo/v3/framework/prefixrouter"
	"flamingo.me/flamingo/v3/framework/systemendpoint"
	"flamingo.me/form"
	"flamingo.me/pugtemplate"
)

// main is our entry point
func main() {

	flamingo.App([]dingo.Module{
		//flamingo framework modules:
		new(requestlogger.Module), // requestlogger show request logs
		new(prefixrouter.Module),
		new(flamingoFramework.SessionModule),
		new(pugtemplate.Module),
		new(locale.Module),
		new(opencensus.Module),
		new(systemendpoint.Module),
		new(healthcheck.Module),
	}, flamingo.ChildAreas(
		config.NewArea("csv", []dingo.Module{
			new(oauth.Module),
			//form module (required by commerce)
			new(form.Module),
			//flamingo-commerce modules
			new(product.Module),
			new(price.Module),
			new(category.Module),
			new(cart.Module),
			new(customer.Module),
			new(payment.Module),
			new(checkout.Module),
			//flamingo-commerce-adpater-standalone:productSearch
			new(productSearch.Module),
			//flamingo-commerce-adpater-standalone:csvcommerce
			new(csvcommerce.ProductModule),
			},
			config.NewArea("de", nil),
		),
	/*	config.NewArea("magento2",
			[]dingo.Module{
				new(oauth.Module),
				//form module (required by commerce)
				new(form.Module),
				//flamingo-commerce modules
				new(product.Module),
				new(price.Module),
				new(category.Module),
				new(cart.Module),
				new(customer.Module),
				new(payment.Module),
				new(checkout.Module),
				//flamingo-commerce-adpater-standalone:productSearch
				new(productSearch.Module),
				new(productSearch.CategoryModule),
				//flamingo-commerce-adpater-magento2
				new(magento2.Module),
				new(magento2.ProductModule),
			},
			config.NewArea("de", nil),
		),*/
	),
	)

}
