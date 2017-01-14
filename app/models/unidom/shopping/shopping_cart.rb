##
# Shopping Cart 是购物车。

class Unidom::Shopping::ShoppingCart < Unidom::Shopping::ApplicationRecord

  self.table_name = 'unidom_shopping_carts'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :shopper, polymorphic: true
  belongs_to :shop,    polymorphic: true

  has_many :items, class_name: 'Unidom::Shopping::ShoppingItem'

  scope :shopped_by, ->(shopper) { where shopper: shopper }
  scope :shop_is,    ->(shop)    { where shop:    shop    }

  ##
  # 将商品 shopped 放入购物车。购物者为 by 。单价为 unit_price ，缺省值为 0 。数量为 quantity ，缺省值是 1 。时间为 at ，缺省为当前时间。如：
  # shopping_cart.add! coca_cola, by: current_person, unit_price: 3.50, quantity: 2
  def add!(shopped, by: nil, unit_price: 0, quantity: 1, at: Time.now)
    item = items.shopped_is(shopped).valid_at.alive.first
    if item.present?
      item.attributes = { shopper: by||shopper, unit_price: unit_price, quantity: quantity+item.quantity }
      item.save!
    else
      items.create! shopped: shopped, shopper: by||shopper, unit_price: unit_price, quantity: quantity, opened_at: at
    end
  end

end
