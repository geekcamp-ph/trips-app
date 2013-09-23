class AddUserIdToItineraries < ActiveRecord::Migration
  def change
    add_column :itineraries, :user_id, :integer, null: false
  end
end
