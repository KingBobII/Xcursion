class CreateItineraryExcursions < ActiveRecord::Migration[7.1]
  def change
    create_table :itinerary_excursions do |t|
      t.references :itinerary, null: false, foreign_key: true
      t.references :excursion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
