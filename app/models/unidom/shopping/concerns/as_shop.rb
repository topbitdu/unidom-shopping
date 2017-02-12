##
# As Shop 是购物场所的领域逻辑关注点。

module Unidom::Shopping::Concerns::AsShop

  extend ActiveSupport::Concern

  included do |includer|

    has_many :shopping_carts, class_name: 'Unidom::Shopping::ShoppingCart', as: :shop

    ##
    # 从当前商店中，获取购物车。购物者为 by 。获取时间为 at ，缺省为当前时间。如：
    # shop.get_cart! by: current_person
    def get_cart!(by: nil, at: Time.now)
      shopping_carts.shopped_by(by).valid_at(now: at).alive.first_or_create! opened_at: at
    end

  end

  module ClassMethods
  end

end
