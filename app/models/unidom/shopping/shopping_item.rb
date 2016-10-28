# Shopping Item 是购物项。

class Unidom::Shopping::ShoppingItem < Unidom::Shopping::ApplicationRecord

  self.table_name = 'unidom_shopping_items'

  include Unidom::Common::Concerns::ModelExtension

  validates :unit_price, presence: true, numericality: { greater_than: 0, less_than: 1000000000 }
  validates :quantity,   presence: true, numericality: { greater_than: 0, less_than: 1000000000 }

  belongs_to :shopping_cart, class_name: 'Unidom::Shopping::ShoppingCart'
  belongs_to :shopper,       polymorphic: true
  belongs_to :shopped,       polymorphic: true

  scope :shopping_cart_is, ->(shopping_cart) { where shopping_cart_id: (shopping_cart.respond_to?(:id) ? shopping_cart.id : shopping_cart) }
  scope :shopped_by,       ->(shopper)       { where shopper: shopper }
  scope :shopped_is,       ->(shopped)       { where shopped: shopped }

end
