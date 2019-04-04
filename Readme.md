# Official Commerce Flamingo Demo

## Getting Started

### Preconditions

This demo uses Flamingo Carotene, so you should have `npm`installed. (https://www.npmjs.com/get-npm)
Also you need go installed. (https://golang.org/)

### Run the demo shop
```
# clone the repo:
git clone https://github.com/i-love-flamingo/commerce-demo-carotene.git
cd commerce-demo-carotene

# Download the test catalog  - you only need to do it once - it includes products.csv and images:
make download-product-data

# Build the flamingo-carotene bases templates:
make frontend-build

# Run flamingo with flamingo-commerce
make serve

```

Now open http://localhost:3210/

## About the Demo Frontend - Template
The demo comes with a simple demo template in "frontend/src" that is using carotene-cli

The template is based on: https://github.com/mdbootstrap/Ecommerce-Template-Bootstrap

The following things have been changed:
- Markup is transformed to pug and splittet according to atomic design
- SaSS is used instead of scss (  docker run -it -v "$(pwd)":/workdir unibeautify/sass-convert -R . --from scss --to sass )

You can start watch mode with rebuilding the frontend after changes with this command:
```
make frontend
```
### License MDBootstrap

Copyright (c) 2017 MDBootstrap.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


## Secondary Adapters used in the Demo:

* flamingo.me/flamingo-commerce-adapter-standalone:
    * Provides "productService" Adapter to get products
    * Provides "productSearchService" Adapter to search for products
    * Both Adapter use the "inMemoryProductRepository" which reads products from a configired csv file during startup.
    
* flamingo.me/flamingo-commerce/v3/category
    * Provides the "categoryServiceFixed" Adapter which just gets the category tree from a configuration


## Production ready?

This demo project is not production ready - at least the following things need to be considered:

* The template is not optimized and just for demo reasons, in a production template we would probably not use this  bootstrap, material design demo as a start. Rather we would start a clean template based on the screendesign.
* Proper CI/CD setup for frontend: "frontend/dist" folder should be excluded (gitignore) and only build during CI pipeline.
* The Secondary Adapters used in the demo are not full featured
