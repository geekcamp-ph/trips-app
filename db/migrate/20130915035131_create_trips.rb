class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
    end
  end
end
