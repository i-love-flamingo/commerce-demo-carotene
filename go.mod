module flamingo.me/commerce-demo-carotene

require (
	flamingo.me/dingo v0.2.9
	flamingo.me/flamingo-commerce-adapter-magento2 v0.0.0-20190603174551-cf9f9f45b257 // indirect
	flamingo.me/flamingo-commerce-adapter-standalone v0.0.1-beta.0.20190903094153-000fa1394a72
	flamingo.me/flamingo-commerce/v3 v3.2.1-0.20200515114133-097d481ea31f
	flamingo.me/flamingo/v3 v3.2.1-0.20200812074650-142034e9fe96
	flamingo.me/form v1.0.1
	flamingo.me/graphql v1.1.0
	flamingo.me/pugtemplate v1.1.3
	flamingo.me/swagger v0.0.0-20200520124928-8b41535a33ab
	github.com/99designs/gqlgen v0.11.4-0.20200726064323-39a12e0f1b6d
	github.com/labstack/gommon v0.2.8 // indirect
	github.com/swaggo/swag v1.6.7 // indirect
	github.com/vektah/gqlparser v1.3.1
)

go 1.13

replace flamingo.me/flamingo/v3 => ../flamingo

replace flamingo.me/flamingo-commerce/v3 => ../flamingo-commerce

replace flamingo.me/flamingo-commerce-adapter-standalone => ../flamingo-commerce-adapter-standalone

replace flamingo.me/flamingo-commerce-adapter-magento2 => ../flamingo-commerce-adapter-magento2

replace flamingo.me/form => ../form

replace flamingo.me/swagger => ../swagger
