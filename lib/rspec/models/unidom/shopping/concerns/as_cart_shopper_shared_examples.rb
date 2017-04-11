shared_examples 'Unidom::Shopping::Concerns::AsCartShopper' do |model_attributes|

  context do

    shopping_cart_1_attributes = {
      shop_id:   SecureRandom.uuid,
      shop_type: 'Unidom::Shopping::Shop::Mock'
    }

    shopping_cart_2_attributes = {
      shop_id:   SecureRandom.uuid,
      shop_type: 'Unidom::Shopping::Shop::Mock'
    }

    it_behaves_like 'has_many', model_attributes, :shopping_carts, Unidom::Shopping::ShoppingCart, [ shopping_cart_1_attributes, shopping_cart_2_attributes ]

  end

end
