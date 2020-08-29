# Official Commerce Flamingo Demo

Watch online: https://demoshop.flamingo.me/en/

Or try the powerful Flamingo-Commerce graphql console: https://demoshop.flamingo.me/en/graphql-console

## What's inside:

The demo shop comes with:

* Using the Flamingo Commerce Standalone Adapter: Products and Categories are indexed from a plain CSV file into an embedded indexed search (bleve). Once an order is placed Flamingo logs the order and sends an E-Mail.

* The multi context feature of Flamingo is used to have 2 different locales (de and en)

* An example template using pug and Flamingo Carotene is used.


## Getting Started

### Preconditions

This demo uses Flamingo Carotene, so you should have `npm` installed. (https://www.npmjs.com/get-npm)
Also you need Go installed. (https://golang.org/)

### Run the demo shop

#### Try out with docker:

```
docker run --rm -p 3210:3210 iloveflamingo/flamingo-commerce-demo-carotene:latest
```
Now open http://localhost:3210/

#### Try the GraphQL API
open http://localhost:3210/en/graphql-console/

#### Run local from source code:
```
# clone the repo:
git clone https://github.com/i-love-flamingo/commerce-demo-carotene.git
cd commerce-demo-carotene

# Download the test catalog  - you only need to do it once - it includes products.csv and images:
make download-product-data

# Prepare translation files:
make translation

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
- Markup was transformed to pug and split according to atomic design
- SASS is used instead of scss (`docker run -it -v "$(pwd)":/workdir unibeautify/sass-convert -R . --from scss --to sass`)

You can start watch mode with rebuilding the frontend after changes with this command:
```
make frontend
```
### License MDBootstrap

Copyright (c) 2017 MDBootstrap.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


## Production ready?

This demo project is **not** production ready - at least the following things need to be considered:

* The template is not optimized and just for demo reasons, in a production template we would probably not use this bootstrap, material design demo as a start. Rather we would start a clean template based on the screen design.
* The Secondary Adapters used in the demo are not full featured.
