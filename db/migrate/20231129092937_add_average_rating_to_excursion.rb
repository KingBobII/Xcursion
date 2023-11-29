class AddAverageRatingToExcursion < ActiveRecord::Migration[7.1]
  def change
    add_column :excursions, :average_rating, :integer
  end
end
