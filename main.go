package main

import (
	"flamingo.me/dingo"
	"flamingo.me/flamingo-commerce-adapter-standalone/emailplaceorder"
	"flamingo.me/graphql"

	"flamingo.me/flamingo-commerce-adapter-standalone/csvindexing"
	"flamingo.me/flamingo-commerce-adapter-standalone/commercesearch"
	"flamingo.me/flamingo-commerce/v3/cart"
	"flamingo.me/flamingo-commerce/v3/category"
	"flamingo.me/flamingo-commerce/v3/checkout"
	"flamingo.me/flamingo-commerce/v3/customer"
	"flamingo.me/flamingo-commerce/v3/payment"
	"flamingo.me/flamingo-commerce/v3/product"
	"flamingo.me/flamingo/v3"
	"flamingo.me/flamingo/v3/core/healthcheck"
	"flamingo.me/flamingo/v3/core/locale"
	"flamingo.me/flamingo/v3/core/requestlogger"
	"flamingo.me/flamingo/v3/framework/config"
	flamingoFramework "flamingo.me/flamingo/v3/framework/flamingo"
	"flamingo.me/flamingo/v3/framework/opencensus"
	"flamingo.me/flamingo/v3/framework/prefixrouter"
	"flamingo.me/flamingo/v3/framework/systemendpoint"
	"flamingo.me/form"
	"flamingo.me/pugtemplate"

	projectGraphql "flamingo.me/commerce-demo-carotene/graphql"
	"flamingo.me/swagger"
)

//go:generate rm -f graphql/generated.go
//go:generate go run -tags graphql main.go graphql
//go:generate go run github.com/swaggo/swag/cmd/swag init --parseDependency=1 --generalInfo=main.go

// main is our entry point

// @title Flamingo Commerce Demo Shop
// @version 1.0
// @BasePath /en
// @license.name MIT
// @contact.name Flamingo
// @contact.url https://gitter.im/i-love-flamingo/community#
// @contact.email flamingo@aoe.com
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
		new(commercesearch.Module),
		new(commercesearch.CategoryModule),
		new(commercesearch.SearchModule),
		new(csvindexing.ProductModule),
		new(emailplaceorder.Module),
		new(graphql.Module),
		new(pugtemplate.Module),
		new(swagger.Module),
	}, flamingo.ChildAreas(
		config.NewArea("csv", nil,
			config.NewArea("de", nil),
		),
	),
	)
}
