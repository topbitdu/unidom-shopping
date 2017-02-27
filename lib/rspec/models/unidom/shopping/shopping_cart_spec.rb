describe Unidom::Shopping::ShoppingCart, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      shopper_id:   SecureRandom.uuid,
      shopper_type: 'Unidom::Shopping::Shopper',
      shop_id:      SecureRandom.uuid,
      shop_type:    'Unidom::Shopping::Shop'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    shopping_item_1_attributes = {
      shopper_id:       SecureRandom.uuid,
      shopper_type:     'Unidom::Shopping::Shopper',
      shopped_id:       SecureRandom.uuid,
      shopped_type:     'Unidom::Shopping::Shopped',
      unit_price:       12.00,
      quantity:         5.00
    }

    shopping_item_2_attributes = {
      shopper_id:       SecureRandom.uuid,
      shopper_type:     'Unidom::Shopping::Shopper',
      shopped_id:       SecureRandom.uuid,
      shopped_type:     'Unidom::Shopping::Shopped',
      unit_price:       19.98,
      quantity:         2.00
    }

    it_behaves_like 'has_many', model_attributes, :items, Unidom::Shopping::ShoppingItem, [ shopping_item_1_attributes, shopping_item_2_attributes ]

  end

end
