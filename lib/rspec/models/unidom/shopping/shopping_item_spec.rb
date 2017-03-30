describe Unidom::Shopping::ShoppingItem, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      shopping_cart_id: SecureRandom.uuid,
      shopper_id:       SecureRandom.uuid,
      shopper_type:     'Unidom::Shopping::Shopper::Mock',
      shopped_id:       SecureRandom.uuid,
      shopped_type:     'Unidom::Shopping::Shopped::Mock',
      unit_price:       12.00,
      quantity:         5.00
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates numericality', model_attributes, :unit_price,
      range: 0..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true
    it_behaves_like 'validates numericality', model_attributes, :quantity,
      range: 0..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true

    shopping_cart_attributes = {
      shopper_id:   SecureRandom.uuid,
      shopper_type: 'Unidom::Shopping::Shopper',
      shop_id:      SecureRandom.uuid,
      shop_type:    'Unidom::Shopping::Shop'
    }

    it_behaves_like 'belongs_to', model_attributes, :shopping_cart, Unidom::Shopping::ShoppingCart, shopping_cart_attributes

    it_behaves_like 'monomorphic scope', model_attributes, :shopping_cart_is, :shopping_cart

  end

end
