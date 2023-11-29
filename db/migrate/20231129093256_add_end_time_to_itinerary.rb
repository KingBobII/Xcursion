class AddEndTimeToItinerary < ActiveRecord::Migration[7.1]
  def change
    add_column :itineraries, :end_time, :date
  end
end
