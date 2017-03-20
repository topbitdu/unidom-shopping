shared_examples 'Unidom::Shopping::Concerns::AsShop' do |model_attributes|

  context do

    shopping_cart_1_attributes = {
      shopper_id:   SecureRandom.uuid,
      shopper_type: 'Unidom::Shopping::Shopper'
    }

    shopping_cart_2_attributes = {
      shopper_id:   SecureRandom.uuid,
      shopper_type: 'Unidom::Shopping::Shopper'
    }

    it_behaves_like 'has_many', model_attributes, :shopping_carts, Unidom::Shopping::ShoppingCart, [ shopping_cart_1_attributes, shopping_cart_2_attributes ]

  end

end
