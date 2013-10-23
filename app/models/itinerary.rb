class Itinerary < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user

  validates :user_id, presence: true
  validates :location, presence: true

  include CalculateEstimatedCost
end
