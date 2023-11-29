class CreateJoinTableExcursionsItineraries < ActiveRecord::Migration[7.1]
  def change
    create_join_table :excursions, :itineraries do |t|
      # t.index [:excursion_id, :itinerary_id]
      # t.index [:itinerary_id, :excursion_id]
    end
  end
end
