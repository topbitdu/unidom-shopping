module Unidom::Shopping::Concerns::AsShop

  extend ActiveSupport::Concern

  included do |includer|

    has_many :shopping_carts, class_name: 'Unidom::Shopping::ShoppingCart', as: :shop

  end

  module ClassMethods
  end

end
