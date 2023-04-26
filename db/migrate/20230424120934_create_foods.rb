class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.references :user, null: false, foreign_key: true, index: true, to_table: :users
      t.string :name, limit: 50
      t.string :measurement_unit
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
