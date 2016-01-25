# Unidom Shopping

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Shopping domain model engine includes Shopping Cart and Shopping Item models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。购物领域模型引擎包括购物车和购物项的模型。

## Usage in Gemfile:
```ruby
gem 'unidom-shopping'
```

## Run the Database Migration:
```shell
rake db:migrate
```

## Call the Model:
```ruby
Unidom::Shopping::ShoppingCart.valid_at.alive.first.items.valid.alive
```
