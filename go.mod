module flamingo.me/commerce-demo-carotene

replace (
	github.com/robertkrimen/otto => github.com/thebod/otto v0.0.0-20170712091932-83d297c4b64a
	golang.org/x/oauth2 => github.com/Ompluscator/oauth2 v0.0.0-20190121141151-b76268579942
)

require (
	flamingo.me/dingo v0.1.6
	flamingo.me/flamingo-commerce-adapter-magento2 v0.0.0-20190603174551-cf9f9f45b257 // indirect
	flamingo.me/flamingo-commerce-adapter-standalone v0.0.1-beta.0.20190903094153-000fa1394a72
	flamingo.me/flamingo-commerce/v3 v3.0.0-beta.3.0.20191025125315-f538f1158c09
	flamingo.me/flamingo/v3 v3.0.3
	flamingo.me/form v1.0.1-0.20191008191024-ff6f3a9330d6
	flamingo.me/graphql v1.0.1
	flamingo.me/pugtemplate v1.0.0
	github.com/99designs/gqlgen v0.9.0
	github.com/labstack/gommon v0.2.8 // indirect
	github.com/mattn/go-colorable v0.1.0 // indirect
	github.com/vektah/gqlparser v1.1.2
)

go 1.13
