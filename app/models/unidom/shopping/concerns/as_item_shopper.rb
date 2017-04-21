##
# As Item Shopper 是购物项所有者的领域逻辑关注点。

module Unidom::Shopping::Concerns::AsItemShopper

  extend  ActiveSupport::Concern
  include Unidom::Common::Concerns::ArgumentValidation

  included do |includer|

    has_many :shopping_items, class_name: 'Unidom::Shopping::ShoppingItem', as: :shopper

    ##
    # 以购物者的身份，将商品 it ，放入购物车 into 。购物时间是 at ，缺省为当前时间。单价是 unit_price ，缺省为 0 。数量是 quantity ，缺省为 1 。如：
    # current_person.add! coca_cola, into: shopping_cart, unit_price: 3.50, quantity: 3
    def add!(it, into: nil, at: Time.now, unit_price: 0, quantity: 1)

      assert_present! :it, it

      query = shopping_items.shopping_cart_is(into).shopped_is(it).valid_at(now: at).alive
      item  = query.first
      if item.present?
        item.unit_price = unit_price
        item.increment! :quantity, quantity
      else
        item = shopping_items.create! shopping_cart: into, shopped: it, unit_price: unit_price, quantity: quantity, opened_at: at
      end
      item
    end

    def add?(it, into: nil, at: Time.now)
      shopping_items.shopping_cart_is(into).shopped_is(it).valid_at(now: at).alive.exists?
    end

  end

  module ClassMethods
  end

end
