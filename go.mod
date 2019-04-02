module flamingo.me/commerce-demo-carotene

replace (
	github.com/robertkrimen/otto => github.com/thebod/otto v0.0.0-20180101010101-83d297c4b64aeb2de4268d9a54c9a503ae2d8139
	golang.org/x/oauth2 => github.com/Ompluscator/oauth2 v0.0.0-20190101010101-b7626857
)

require (
	flamingo.me/dingo v0.1.4
	flamingo.me/flamingo-commerce-adapter-standalone v0.0.1-beta
	flamingo.me/flamingo-commerce/v3 v3.0.0-beta.1
	flamingo.me/flamingo/v3 v3.0.0-beta.1.0.20190402212643-e7f067aac32f
	flamingo.me/form v1.0.0-alpha.1
	flamingo.me/pugtemplate v1.0.0-alpha.1
	github.com/labstack/gommon v0.2.8 // indirect
	github.com/mattn/go-colorable v0.1.0 // indirect
	golang.org/x/sys v0.0.0-20190213121743-983097b1a8a3 // indirect
	gopkg.in/square/go-jose.v2 v2.2.2 // indirect
)

replace flamingo.me/flamingo/v3 => ../flamingo

replace flamingo.me/flamingo-commerce/v3 => ../flamingo-commerce

replace flamingo.me/flamingo-commerce-adapter-standalone => ../flamingo-commerce-adapter-standalone
