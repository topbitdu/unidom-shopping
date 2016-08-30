module Unidom::Shopping::Concerns::AsCartShopper

  extend ActiveSupport::Concern

  included do |includer|

    has_many :shopping_carts, class_name: 'Unidom::Shopping::ShoppingCart', as: :shopper

  end

  module ClassMethods
  end

end
