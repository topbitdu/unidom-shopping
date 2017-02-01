##
# As Cart Shopper 是购物车所有者的领域逻辑关注点。

module Unidom::Shopping::Concerns::AsCartShopper

  extend ActiveSupport::Concern

  included do |includer|

    has_many :shopping_carts, class_name: 'Unidom::Shopping::ShoppingCart', as: :shopper

    ##
    # 以购物者的身份，从指定的商店 from 获取购物车。时间为 at ，缺省为当前时间。如：
    # current_person.get_cart! from: shop
    def get_cart!(from: nil, at: Time.now)
      shopping_carts.shop_is(from).valid_at(now: at).alive.first_or_create! opened_at: at
    end

    def get_cart?(from: nil, at: Time.now)
      shopping_carts.shop_is(from).valid_at(now: at).alive.exists?
    end

  end

  module ClassMethods
  end

end
