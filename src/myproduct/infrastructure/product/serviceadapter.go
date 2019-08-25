package product

import (
	"context"
	priceDomain "flamingo.me/flamingo-commerce/v3/price/domain"
	"flamingo.me/flamingo-commerce/v3/product/domain"
)

type (
	// ServiceAdapter interface
	ServiceAdapter struct {

	}
)


func (s *ServiceAdapter) Get(ctx context.Context, marketplaceCode string) (domain.BasicProduct, error) {
	return domain.SimpleProduct{
		Identifier: marketplaceCode,
		BasicProductData: domain.BasicProductData{
			Title: "My Title",
			Description: "My Description",
			MarketPlaceCode: marketplaceCode,
		},
		Saleable: domain.Saleable{
			IsSaleable: true,
			ActivePrice: domain.PriceInfo{
				Default: priceDomain.NewFromInt(199,100,"EUR"),
			},
		},
	}, nil

}