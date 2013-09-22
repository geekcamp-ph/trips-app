class Itinerary < ActiveRecord::Base
  belongs_to :trip
  validates :location, presence: true

  class << self
    def for_year(date=Time.zone.now)
      self.where("travel_on > ? and travel_on < ?", date.beginning_of_year, date.end_of_year)
    end

    def total_yearly_estimated_cost(date=Time.zone.now)
      self.for_year(date).map(&:estimated_cost).reduce(:+) || 0.00
    end
  end
end
