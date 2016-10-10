module Unidom::Shopping::Concerns::AsItemShopper

  extend ActiveSupport::Concern

  included do |includer|

    has_many :shopping_items, class_name: 'Unidom::Shopping::ShoppingItem', as: :shopper

    def add!(it, into: nil, at: Time.now, unit_price: 0, quantity: 1)
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
