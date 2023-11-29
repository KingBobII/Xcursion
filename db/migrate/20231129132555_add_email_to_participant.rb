class AddEmailToParticipant < ActiveRecord::Migration[7.1]
  def change
    add_column :participants, :email, :string
  end
end
