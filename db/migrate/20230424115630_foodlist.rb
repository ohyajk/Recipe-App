class CreateFoodlists < ActiveRecord::Migration[7.0]
  def change
    create_table :foodlists do |t|
      t.references :user, foreign_key: { to_table: :users }, index: true, null: false
      t.string :name, limit: 50
      t.string :measurement_unit
      t.integer :price
      t.integer :quantity
      t.timestamps
    end
  end
end
