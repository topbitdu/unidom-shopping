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

    it_behaves_like 'validates', model_attributes, :unit_price,
      {                                } => 0,
      { unit_price: nil                } => 2,
      { unit_price: ''                 } => 2,
      { unit_price: '1'                } => 0,
      { unit_price: 1                  } => 0,
      { unit_price: 'A'                } => 1,
      { unit_price: '1.23'             } => 0,
      { unit_price: 1.23               } => 0,
      { unit_price: '-0.01'            } => 1,
      { unit_price: -0.01              } => 1,
      { unit_price: '0'                } => 1,
      { unit_price: 0                  } => 1,
      { unit_price: '0.01'             } => 0,
      { unit_price: 0.01               } => 0,
      { unit_price: '999_999_999.99'   } => 0,
      { unit_price: 999_999_999.99     } => 0,
      { unit_price: '1_000_000_000'    } => 1,
      { unit_price: 1_000_000_000      } => 1,
      { unit_price: '1_000_000_000.01' } => 1,
      { unit_price: 1_000_000_000.01   } => 1

    it_behaves_like 'validates', model_attributes, :quantity,
      {                              } => 0,
      { quantity: nil                } => 2,
      { quantity: ''                 } => 2,
      { quantity: '1'                } => 0,
      { quantity: 1                  } => 0,
      { quantity: 'A'                } => 1,
      { quantity: '1.23'             } => 0,
      { quantity: 1.23               } => 0,
      { quantity: '-0.01'            } => 1,
      { quantity: -0.01              } => 1,
      { quantity: '0'                } => 1,
      { quantity: 0                  } => 1,
      { quantity: '0.01'             } => 0,
      { quantity: 0.01               } => 0,
      { quantity: '999_999_999.99'   } => 0,
      { quantity: 999_999_999.99     } => 0,
      { quantity: '1_000_000_000'    } => 1,
      { quantity: 1_000_000_000      } => 1,
      { quantity: '1_000_000_000.01' } => 1,
      { quantity: 1_000_000_000.01   } => 1

  end

end
