class AddEstimatedCostToItineraries < ActiveRecord::Migration
  def change
    add_column :itineraries, :estimated_cost, :decimal, precision: 10, scale: 2, default: 0.00
  end
end
