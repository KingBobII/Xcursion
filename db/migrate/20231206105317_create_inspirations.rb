class CreateInspirations < ActiveRecord::Migration[7.1]
  def change
    create_table :inspirations do |t|
      t.string :city
      t.integer :capacity
      t.integer :duration
      t.string :category
      t.string :setting
      t.integer :budget
      t.string :interests
      t.text :requirements

      t.timestamps
    end
  end
end
