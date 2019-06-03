module flamingo.me/commerce-demo-carotene

replace (
	github.com/robertkrimen/otto => github.com/thebod/otto v0.0.0-20180101010101-83d297c4b64aeb2de4268d9a54c9a503ae2d8139
	golang.org/x/oauth2 => github.com/Ompluscator/oauth2 v0.0.0-20190101010101-b7626857
)

require (
	flamingo.me/dingo v0.1.5
	flamingo.me/flamingo-commerce-adapter-magento2 v0.0.0-20190603174551-cf9f9f45b257 // indirect
	flamingo.me/flamingo-commerce-adapter-standalone v0.0.1-beta.0.20190603174440-f3912c64baaf
	flamingo.me/flamingo-commerce/v3 v3.0.0-beta.1.0.20190422194850-9dc0a7083957
	flamingo.me/flamingo/v3 v3.0.0-beta.2.0.20190515120627-9cabe248cf01
	flamingo.me/form v1.0.0-alpha.1
	flamingo.me/pugtemplate v1.0.0-alpha.1
	github.com/labstack/gommon v0.2.8 // indirect
	github.com/mattn/go-colorable v0.1.0 // indirect
	gopkg.in/square/go-jose.v2 v2.2.2 // indirect
)
