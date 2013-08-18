class Itinerary < ActiveRecord::Base
  validates :location, presence: true
end
