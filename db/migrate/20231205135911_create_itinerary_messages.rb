class CreateItineraryMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :itinerary_messages do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :itinerary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
