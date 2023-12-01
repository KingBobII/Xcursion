class AddReviewToExcursion < ActiveRecord::Migration[7.1]
  def change
    add_column :excursions, :review, :text
  end
end
