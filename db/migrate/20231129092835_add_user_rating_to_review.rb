class AddUserRatingToReview < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :user_rating, :integer
  end
end
