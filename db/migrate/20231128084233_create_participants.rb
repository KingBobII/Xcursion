class CreateParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :participants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :itinerary, null: false, foreign_key: true
      t.integer :rsvp

      t.timestamps
    end
  end
end
