class CreateUnidomShoppingItems < ActiveRecord::Migration

  def change

    create_table :unidom_shopping_items, id: :uuid do |t|

      t.references :shopping_cart, type: :uuid, null: false
      t.references :shopper, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :shopped, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.decimal :unit_price, null: false, default: 0.0, precision: 12, scale: 2
      t.decimal :quantity,   null: false, default: 0.0, precision: 12, scale: 2

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_shopping_items, :shopping_cart_id
    add_index :unidom_shopping_items, :shopper_id
    add_index :unidom_shopping_items, :shopped_id

  end

end
