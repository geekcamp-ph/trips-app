module CalculateEstimatedCost

  extend ActiveSupport::Concern

  module ClassMethods
    def for_user(user)
      self.where(user_id: user)
    end

    def for_year(date=Time.zone.now)
      self.where("travel_on > ? and travel_on < ?", date.beginning_of_year, date.end_of_year)
    end

    def total_yearly_estimated_cost(user, date=Time.zone.now)
      self.for_user(user).for_year(date).map(&:estimated_cost).reduce(:+) || 0.00
    end
  end

end
