describe Unidom::Shopping::ShoppingItem, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      shopping_cart_id: SecureRandom.uuid,
      shopper_id:       SecureRandom.uuid,
      shopper_type:     'Unidom::Shopping::Shopper',
      shopped_id:       SecureRandom.uuid,
      shopped_type:     'Unidom::Shopping::Shopped',
      unit_price:       12.00,
      quantity:         5.00
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
