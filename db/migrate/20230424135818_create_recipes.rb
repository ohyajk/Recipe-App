class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipelists do |t|
      t.references :user, null: false, foreign_key: true, index: true, to_table: :users
      t.string :name, limit: 50
      t.integer :preparation_time
      t.integer :cooking_time
      t.string :description
      t.boolean :public

      t.timestamps
    end
  end
end
