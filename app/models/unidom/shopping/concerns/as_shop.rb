##
# As Shop 是购物场所的领域逻辑关注点。

module Unidom::Shopping::Concerns::AsShop

  extend ActiveSupport::Concern

  included do |includer|

    has_many :shopping_carts, class_name: 'Unidom::Shopping::ShoppingCart', as: :shop

    def get_cart!(by: nil, at: Time.now)
      shopping_carts.shopped_by(by).valid_at(now: at).alive.first_or_create! opened_at: at
    end

  end

  module ClassMethods
  end

end
