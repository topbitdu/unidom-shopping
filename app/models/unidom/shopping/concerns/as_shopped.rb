module Unidom::Shopping::Concerns::AsShopped

  extend ActiveSupport::Concern

  included do |includer|

    has_many :shopping_items, class_name: 'Unidom::Shopping::ShoppingItem', as: :shopped

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

    #def is_added?(into: nil, by: nil, at: Time.now)
    #  query = shopping_items.shopping_cart_is(into)
    #  query = query.shopped_by(by) if by.present?
    #  query = query.valid_at(now: at).alive
    #  query.exists?
    #end

  end

  module ClassMethods
  end

end
