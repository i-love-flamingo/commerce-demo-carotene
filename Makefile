CONTEXT?=dev:testproducts
REPLACE?=-replace flamingo.me/flamingo/v3=../flamingo -replace flamingo.me/flamingo-commerce/v3=../flamingo-commerce -replace flamingo.me/flamingo-commerce-adapter-standalone=../flamingo-commerce-adapter-standalone -replace flamingo.me/flamingo-commerce-adapter-magento2=../flamingo-commerce-adapter-magento2 -replace flamingo.me/form=../form
DROPREPLACE?=-dropreplace flamingo.me/flamingo/v3 -dropreplace flamingo.me/flamingo-commerce/v3 -dropreplace flamingo.me/flamingo-commerce-adapter-standalone -dropreplace flamingo.me/flamingo-commerce-adapter-magento2 -dropreplace flamingo.me/form

.PHONY: prepare-product-data download-product-data build serve serve-jaeger jaeger-docker local unlocal frontend frontend-build translation update dockerpublish

prepare-product-data:
	cd ressources && zip -r products.zip products

download-product-data:
	cd ressources && wget https://github.com/i-love-flamingo/commerce-demo-carotene/releases/download/productdata1/products.zip && unzip products.zip

build:
	go build main.go

serve:
	DEBUG=1 CONTEXT=$(CONTEXT) go run main.go serve

serve-jaeger: translation
	DEBUG=1 CONTEXT=$(CONTEXT) go run main.go --flamingo-config 'opencensus.jaeger.enable: true' serve

jaeger-docker:
	docker run -e COLLECTOR_ZIPKIN_HTTP_PORT=9411 -p 5775:5775/udp -p 6831:6831/udp -p 6832:6832/udp -p 5778:5778 -p 16686:16686 -p 14268:14268 -p 9411:9411 jaegertracing/all-in-one:latest

frontend: frontend-build
	bash -c 'cd frontend && npx flamingo-carotene dev'

frontend-build:
	bash -c 'cd frontend && npm ci && npx flamingo-carotene build'

translation:
	./preparetranslations.sh

local:
	git config filter.gomod-commercedemo-flamingo.smudge 'go mod edit -fmt -print $(REPLACE) /dev/stdin'
	git config filter.gomod-commercedemo-flamingo.clean 'go mod edit -fmt -print $(DROPREPLACE) /dev/stdin'
	git config filter.gomod-commercedemo-flamingo.required true
	go mod edit -fmt $(REPLACE)

unlocal:
	git config filter.gomod-commercedemo-flamingo.smudge ''
	git config filter.gomod-commercedemo-flamingo.clean ''
	git config filter.gomod-commercedemo-flamingo.required false
	go mod edit -fmt $(DROPREPLACE)

update:
	go get -u flamingo.me/flamingo/v3 flamingo.me/flamingo-commerce/v3@v3

dockerpublish:
	GOOS=linux go build -o flamingo-commerce-demo-carotene main.go
	mv config/config_local.yml .
	docker build --no-cache -t iloveflamingo/flamingo-commerce-demo-carotene .
	docker push iloveflamingo/flamingo-commerce-demo-carotene:latest
	mv config_local.yml config/

generate-graphql:
	go generate