module Unidom::Shopping::Concerns::AsItemShopper

  extend ActiveSupport::Concern

  included do |includer|

    has_many :shopping_items, class_name: 'Unidom::Shopping::ShoppingItem', as: :shopper

  end

  module ClassMethods
  end

end
