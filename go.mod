module flamingo.me/commerce-demo-carotene

replace (
	github.com/robertkrimen/otto => github.com/thebod/otto v0.0.0-20180101010101-83d297c4b64aeb2de4268d9a54c9a503ae2d8139
	golang.org/x/oauth2 => github.com/Ompluscator/oauth2 v0.0.0-20190101010101-b7626857
)

require (
	flamingo.me/dingo v0.1.6
	flamingo.me/flamingo-commerce-adapter-magento2 v0.0.0-20190603174551-cf9f9f45b257 // indirect
	flamingo.me/flamingo-commerce-adapter-standalone v0.0.1-beta.0.20190903094153-000fa1394a72
	flamingo.me/flamingo-commerce/v3 v3.0.0-beta.3.0.20190917073529-b8e24b9c6cdb
	flamingo.me/flamingo/v3 v3.0.2
	flamingo.me/form v1.0.0
	flamingo.me/graphql v1.0.1
	flamingo.me/pugtemplate v1.0.0
	github.com/99designs/gqlgen v0.9.0
	github.com/labstack/gommon v0.2.8 // indirect
	github.com/mattn/go-colorable v0.1.0 // indirect
	github.com/vektah/gqlparser v1.1.2
)
