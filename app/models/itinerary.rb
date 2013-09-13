class Itinerary < ActiveRecord::Base
  validates :location, presence: true

  class << self
    def monthly_budget
      20000
    end

    def total_estimated_cost(month=Time.now.strftime('%m'))
      self.where("strftime('%m', travel_on) = ?", month).map(&:estimated_cost).reduce(:+)
    end

    def remaining_budget
      monthly_budget-total_estimated_cost
    end
  end

end
