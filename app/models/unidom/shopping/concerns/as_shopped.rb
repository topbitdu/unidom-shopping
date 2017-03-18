##
# As Shopped 是被购买的商品的领域逻辑关注点。

module Unidom::Shopping::Concerns::AsShopped

  extend ActiveSupport::Concern

  included do |includer|

    has_many :shopping_items, class_name: 'Unidom::Shopping::ShoppingItem', as: :shopped

    ##
    # 将当前商品放入购物车 into ，购物者是 by 。购物时间是 at ，缺省为当前时间。单价是 unit_price ，缺省为 0 。数量是 quantity ，缺省为 1 。如：
    # coca_cola.is_added! into: shopping_cart, by: current_person, unit_price: 3.50, quantity: 2
    def is_added!(into: nil, by: nil, at: Time.now, unit_price: 0, quantity: 1)
      query = shopping_items.shopping_cart_is(into).valid_at(now: at).alive
      item  = query.first
      if item.present?
        item.unit_price = unit_price
        item.shopper    = by
        item.increment! :quantity, quantity
      else
        item = shopping_items.create! shopping_cart: into, shopper: by, unit_price: unit_price, quantity: quantity, opened_at: at
      end
      item
    end

    def is_added?(into: nil, by: nil, at: Time.now)
      query = shopping_items.shopping_cart_is(into)
      query = query.shopped_by(by) if by.present?
      query = query.valid_at(now: at).alive
      query.exists?
    end

  end

  module ClassMethods
  end

end
