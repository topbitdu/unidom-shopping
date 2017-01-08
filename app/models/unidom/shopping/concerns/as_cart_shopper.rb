##
# As Cart Shopper 是购物车所有者的领域逻辑关注点。

module Unidom::Shopping::Concerns::AsCartShopper

  extend ActiveSupport::Concern

  included do |includer|

    has_many :shopping_carts, class_name: 'Unidom::Shopping::ShoppingCart', as: :shopper

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
