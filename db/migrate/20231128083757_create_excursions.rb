class CreateExcursions < ActiveRecord::Migration[7.1]
  def change
    create_table :excursions do |t|
      t.string :title
      t.string :image
      t.string :city
      t.integer :capacity
      t.integer :length
      t.text :description
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
