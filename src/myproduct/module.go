package myproduct

import (
	"flamingo.me/commerce-demo-carotene/src/myproduct/infrastructure/product"
	"flamingo.me/dingo"
	productdomain "flamingo.me/flamingo-commerce/v3/product/domain"
)

type (
	// Module for myadapters
	Module struct {
	}
)

// Configure DI
func (m *Module) Configure(injector *dingo.Injector) {
	injector.Override((*productdomain.ProductService)(nil),"").To(product.ServiceAdapter{})
}
