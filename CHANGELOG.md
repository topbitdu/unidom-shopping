# Unidom Shopping Change Log 购物领域模型引擎变更日志

## v0.1
1. Shopping Cart model & migration (20020501000000)
2. Shopping Item model & migration (20020502000000)

## v0.2
1. Improved the Shopping Cart model to include the Model Extension concern
2. Improved the Shopping Item model to include the Model Extension concern

## v0.3
1. Improved the Shopping Cart model to add the #``add!`` method
2. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.9

## v1.0
1. Improved the Shopping Cart model to support the Keyword Arguments

## v1.0.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v1.1
1. As Cart Shopper concern
2. As Item Shopper concern

## v1.2
1. Improved the As Cart Shopper concern to add the #``get_cart!`` method
2. Improved the As Item Shopper concern to add the #``add!`` method

## v1.3
1. Improved the As Cart Shopper concern to add the #``get_cart?`` method
2. Improved the As Item Shopper concern to add the #``add?`` method

## v1.4
1. As Shopped concern
2. As Shop concern

## v1.5
1. Improved the As Shopped concern to add the #``is_added!`` method
2. Improved the As Shop concern to add the #``get_cart!`` method
3. Improved the As Item Shopper concern for the #``add!`` method

## v1.6
1. Improved the As Shopped concern to add the #``is_added?`` method

## v1.6.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v1.6.2
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v1.6.3
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1

## v1.6.4
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improved the Engine class to include the Engine Extension concern

## v1.6.5
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improved the models to support the namespace neglecting

## v1.7
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v1.7.1
1. Improved the Shopping Item spec for the validations on the #``unit_price`` attribute, & the #``quantity`` attribute

## v1.7.2
1. Improve the Shopping Cart spec for the ``has_many :items, class_name: 'Unidom::Shopping::ShoppingItem'`` macro
2. Improve the Shopping Item spec for the ``belongs_to :shopping_cart, class_name: 'Unidom::Shopping::ShoppingCart'`` macro

## v1.7.3
1. Improve the Shopping Item spec for the ``shopping_cart_is`` scope

## v1.7.4
1. Improve the Shopping Item model for the validations on the #``unit_price`` attribute, & the #``quantity`` attribute
2. Improve the Shopping Item spec for the validations on the #``unit_price`` attribute, & the #``quantity`` attribute
