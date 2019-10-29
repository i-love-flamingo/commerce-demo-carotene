package main

import (
	"flamingo.me/dingo"
	"flamingo.me/graphql"

	"flamingo.me/flamingo-commerce-adapter-standalone/csvcommerce"
	"flamingo.me/flamingo-commerce-adapter-standalone/productSearch"
	"flamingo.me/flamingo-commerce/v3/cart"
	"flamingo.me/flamingo-commerce/v3/category"
	"flamingo.me/flamingo-commerce/v3/checkout"
	"flamingo.me/flamingo-commerce/v3/customer"
	"flamingo.me/flamingo-commerce/v3/payment"
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

	projectGraphql "flamingo.me/commerce-demo-carotene/graphql"
)

//go:generate rm -f graphql/generated.go
//go:generate go run -tags graphql main.go graphql

// main is our entry point
func main() {

	flamingo.App([]dingo.Module{
		//flamingo framework modules:
		new(requestlogger.Module), // requestlogger show request logs
		new(prefixrouter.Module),
		new(flamingoFramework.SessionModule),

		new(locale.Module),
		new(opencensus.Module),
		new(systemendpoint.Module),
		new(healthcheck.Module),
		new(projectGraphql.Module),
		new(oauth.Module),
		//form module (required by commerce)
		new(form.Module),
		//flamingo-commerce modules
		new(product.Module),
		//new(price.Module),
		new(category.Module),
		new(cart.Module),
		new(customer.Module),
		new(payment.Module),
		new(checkout.Module),
		//flamingo-commerce-adpater-standalone modules:
		new(productSearch.Module),
		new(csvcommerce.ProductModule),

		new(graphql.Module),
		new(pugtemplate.Module),
	}, flamingo.ChildAreas(
		config.NewArea("csv", nil,
			config.NewArea("de", nil),
		),
	),
	)
}
