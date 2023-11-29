class AddUsernameToParticipant < ActiveRecord::Migration[7.1]
  def change
    add_column :participants, :username, :string
  end
end
