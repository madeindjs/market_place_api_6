# Market Place API

This repository contains application example build into the [API on Rails 6](https://github.com/madeindjs/api_on_rails) book.

This final application will scratch the surface of being a market place where users will be able to place orders, upload products and more. There are plenty of options out there to set up an online store, such as [Shopify](http://shopify.com), [Spree](http://spreecommerce.com/) or [Magento](http://magento.com).

The purpose of this application is not only to teach you how to build an API with Rails but rather to teach you how to build an *evolutive* and *maintainable* API with Rails. That is, improve your current knowledge with Rails. On this journey, you will learn to:

- Building JSON responses
- Test your end-points with unit and functional tests
- Set up authentication with JSON Web Tokens (JWT)
- Optimize and cache the API

## Setup

~~~bash
$ git clone https://github.com/madeindjs/market_place_api_6
$ cd market_place_api_6
$ bundle install
$ rake db:create && rake db:migrate
~~~

## Requirments

- Ruby 2.5+
- Sqlite
