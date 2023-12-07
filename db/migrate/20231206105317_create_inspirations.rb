class CreateInspirations < ActiveRecord::Migration[7.1]
  def change
    create_table :inspirations do |t|
      t.integer :capacity
      t.integer :budget
      t.string :setting
      t.string :location
      t.string :interests
      t.string :duration
      t.text :requirements

      t.timestamps
    end
  end
end
