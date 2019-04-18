class CreateDoses < ActiveRecord::Migration[5.2]
  def change
    create_table :doses do |t|
      t.string :name
      t.string :description
      t.references :ingredient, foreign_key: true
      t.references :cocktail, foreign_key: true
      t.timestamps null: false
    end
  end
end
