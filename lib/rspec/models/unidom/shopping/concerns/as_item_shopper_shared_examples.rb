shared_examples 'Unidom::Shopping::Concerns::AsItemShopper' do |model_attributes|

  context do

    shopping_item_1_attributes = {
      shopping_cart_id: SecureRandom.uuid,
      shopper_id:       SecureRandom.uuid,
      shopper_type:     'Unidom::Shopping::Shopper::Mock',
      shopped_id:       SecureRandom.uuid,
      shopped_type:     'Unidom::Shopping::Shopped::Mock',
      unit_price:       10.00,
      quantity:         1.00
    }

    shopping_item_2_attributes = {
      shopping_cart_id: SecureRandom.uuid,
      shopper_id:       SecureRandom.uuid,
      shopper_type:     'Unidom::Shopping::Shopper::Mock',
      shopped_id:       SecureRandom.uuid,
      shopped_type:     'Unidom::Shopping::Shopped::Mock',
      unit_price:       12.00,
      quantity:         3.00
    }

    it_behaves_like 'has_many', model_attributes, :shopping_items, Unidom::Shopping::ShoppingItem, [ shopping_item_1_attributes, shopping_item_2_attributes ]

  end

end
