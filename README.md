# Unidom Shopping 购物领域模型引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/unidom-shopping/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/unidom-shopping.svg)](https://badge.fury.io/rb/unidom-shopping)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-shopping.svg)](https://gemnasium.com/github.com/topbitdu/unidom-shopping)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Shopping domain model engine includes Shopping Cart and Shopping Item models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。购物领域模型引擎包括购物车和购物项的模型。



## Recent Update

Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.



## Usage in Gemfile

```ruby
gem 'unidom-shopping'
```



## Run the Database Migration

```shell
rake db:migrate
```
The migration versions start with 200205.



## Call the Model

```ruby
# Create Shopping Cart
lady = Party.create name: 'Ann'
shop = Shop.create  name: 'WalMart'
shopping_cart = Unidom::Shopping::ShoppingCart.create shopper: lady, shop: shop, opened_at: Time.now

# Add Products into Shopping Cart
fish = Product.create name: 'Fish'
ball = Prdduct.create name: 'Ball'
shopping_cart.items.create! shopper: lady, shopped: fish, unit_price: 39.96, quantity: 2, opened_at: Time.now
shopping_cart.items.create! shopper: lady, shopped: ball, unit_price: 19.99, quantity: 1, opened_at: Time.now
# or
shopping_cart.add! fish, unit_price: 39.96, quantity: 2, at: Time.now
shopping_cart.add! ball, unit_price: 19.99

# Find the Shopping Cart
shopping_cart = Unidom::Shopping::ShoppingCart.shopped_by(lady).shop_is(shop).valid_at.alive.first
shopping_cart.items.valid_at.alive # fish & ball
```



## Include the Concerns

```ruby
include Unidom::Shopping::Concerns::AsCartShopper
include Unidom::Shopping::Concerns::AsItemShopper
include Unidom::Shopping::Concerns::AsShop
include Unidom::Shopping::Concerns::AsShopped
```

### As Cart Shopper

The As Cart Shopper concern do the following tasks for the includer automatically:
1. Define the has_many :shopping_carts macro as: ``has_many :shopping_carts, class_name: 'Unidom::Shopping::ShoppingCart', as: :shopper``
2. Define the #get_cart! method as: ``get_cart!(from: nil, at: Time.now)``
3. Define the #get_cart? method as: ``get_cart?(from: nil, at: Time.now)``

### As Item Shopper

The As Item Shopper concern do the following tasks for the includer automatically:
1. Define the has_many :shopping_items macro as: ``has_many :shopping_items, class_name: 'Unidom::Shopping::ShoppingItem', as: :shopper``
2. Define the #add! method as: ``add!(it, into: nil, at: Time.now, unit_price: 0, quantity: 1)``
3. Define the #add? method as: ``add?(it, into: nil, at: Time.now)``

### As Shop

The As Shop concern do the following tasks for the includer automatically:
1. Define the has_many :shopping_carts macro as: ``has_many :shopping_carts, class_name: 'Unidom::Shopping::ShoppingCart', as: :shop``
2. Define the #get_cart! method as: ``get_cart!(by: nil, at: Time.now)``

### As Shopped

The As Shopped concern do the following tasks for the includer automatically:
1. Define the has_many :shopping_items macro as: ``has_many :shopping_items, class_name: 'Unidom::Shopping::ShoppingItem', as: :shopped``
2. Define the #is_added! method as: ``is_added!(into: nil, by: nil, at: Time.now, unit_price: 0, quantity: 1)``
3. Define the #is_added? method as: ``is_added?(into: nil, by: nil, at: Time.now)``



## Disable the Model & Migration

If you only need the app components other than models, the migrations should be neglected, and the models should not be loaded.
```ruby
# config/initializers/unidom.rb
Unidom::Common.configure do |options|

  options[:neglected_namespaces] = %w{
    Unidom::Shopping
  }

end
```



## RSpec examples

### RSpec example manifest (run automatically)

```ruby
# spec/models/unidom_spec.rb
require 'unidom/shopping/models_rspec'

# spec/types/unidom_spec.rb
require 'unidom/shopping/types_rspec'

# spec/validators/unidom_spec.rb
require 'unidom/shopping/validators_rspec'
```

### RSpec shared examples (to be integrated)

```ruby
# lib/unidom.rb
def initialize_unidom

  Unidom::Party::Shop.class_eval do
    include Unidom::Shopping::Concerns::AsShop
  end

  Unidom::Product::Product.class_eval do
    include Unidom::Shopping::Concerns::AsShopped
  end

end

# spec/rails_helper.rb
require 'unidom'
initialize_unidom

# spec/support/unidom_rspec_shared_examples.rb
require 'unidom/shopping/rspec_shared_examples'

# spec/models/unidom/party/shop_spec.rb
describe Unidom::Party::Shop, type: :model do

  context do

    model_attribtues = {
      name: 'WalMart'
    }

    it_behaves_like 'Unidom::Shopping::Concerns::AsShop', model_attribtues

  end

end

# spec/models/unidom/product/product_spec.rb
describe Unidom::Product::Product, type: :model do

  context do

    model_attribtues = {
      name:             'Model X',
      abbreviation:     'MX',
      measurement_unit: 'set',
      packing_norm:     '1 per 1'
    }

    it_behaves_like 'Unidom::Shopping::Concerns::AsShopped', model_attribtues

  end

end
```
