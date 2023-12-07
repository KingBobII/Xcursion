class CreateExcursions < ActiveRecord::Migration[7.1]
  def change
    create_table :excursions do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :city
      t.integer :capacity
      t.integer :duration
      t.string :category
      t.string :setting
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
