module Unidom::Shopping::Concerns::AsShopped

  extend ActiveSupport::Concern

  included do |includer|

    has_many :shopping_items, class_name: 'Unidom::Shopping::ShoppingItem', as: :shopped

  end

  module ClassMethods
  end

end
