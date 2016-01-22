# Shopping Cart 是购物车。

class Unidom::Shopping::ShoppingCart < ActiveRecord::Base

  self.table_name = 'unidom_shopping_carts'

  belongs_to :shopper, polymorphic: true
  belongs_to :shop,    polymorphic: true

  has_many :items, class_name: 'Unidom::Shopping::ShoppingItem', as: :shopping_cart

  scope :shopped_by, ->(shopper) { where shopper: shopper }
  scope :shop_is,    ->(shop)    { where shop:    shop    }

end
