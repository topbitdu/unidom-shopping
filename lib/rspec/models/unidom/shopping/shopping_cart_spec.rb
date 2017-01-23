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

  end

end
