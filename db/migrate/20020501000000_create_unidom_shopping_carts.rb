class CreateUnidomShoppingCarts < ActiveRecord::Migration

  def change

    create_table :unidom_shopping_carts, id: :uuid do |t|

      t.references :shopper, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :shop,    type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_shopping_carts, :shopper_id
    add_index :unidom_shopping_carts, :shop_id

  end

end
