# Shopping Cart 是购物车。

class Unidom::Shopping::ShoppingCart < ActiveRecord::Base

  self.table_name = 'unidom_shopping_carts'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :shopper, polymorphic: true
  belongs_to :shop,    polymorphic: true

  has_many :items, class_name: 'Unidom::Shopping::ShoppingItem'

  scope :shopped_by, ->(shopper) { where shopper: shopper }
  scope :shop_is,    ->(shop)    { where shop:    shop    }

  def add!(shopped, unit_price, quantity = 1, opened_at = Time.now)
    item = items.shopped_is(shopped).valid_at.alive.first
    if item.present?
      item.attributes = { shopper: shopper, unit_price: unit_price, quantity: quantity+item.quantity }
      item.save!
    else
      items.create! shopped: shopped, shopper: shopper, unit_price: unit_price, quantity: quantity, opened_at: opened_at
    end
  end

end
