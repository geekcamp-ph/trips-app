class Itinerary < ActiveRecord::Base
  belongs_to :trip
  validates :location, presence: true

  class << self
    def monthly_budget
      20000
    end

    def total_estimated_cost(month=Time.now.strftime('%m'))
      self.where("strftime('%m', travel_on) = ?", month).map(&:estimated_cost).reduce(:+) || 0.00
    end

    def remaining_budget
      monthly_budget-total_estimated_cost
    end
  end

end
