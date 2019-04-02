CONTEXT?=dev:testproducts
REPLACE?=-replace flamingo.me/flamingo/v3=../flamingo -replace flamingo.me/flamingo-commerce/v3=../flamingo-commerce -replace flamingo.me/flamingo-commerce-adapter-standalone=../flamingo-commerce-adapter-standalone
DROPREPLACE?=-dropreplace flamingo.me/flamingo/v3 -dropreplace flamingo.me/flamingo-commerce/v3 -dropreplace flamingo.me/flamingo-commerce-adapter-standalone

.PHONY: serve local unlocal commit frontend frontend-build translation bookingserviceVuku rabbitmqInDocker

prepare-product-data:
	cd ressources && zip -r products.zip products

download-product-data:
	cd ressources && wget https://github.com/i-love-flamingo/commerce-demo-carotene/releases/download/productdata1/products.zip && unzip products.zip

build:
	go build main.go

serve: translation
	DEBUG=1 CONTEXT=$(CONTEXT) go run main.go serve

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
	docker build --no-cache -t iloveflamingo/flamingo-commerce-demo-carotene .
	docker push iloveflamingo/flamingo-commerce-demo-carotene:latest