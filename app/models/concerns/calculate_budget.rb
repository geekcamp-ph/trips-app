module CalculateBudget

  extend ActiveSupport::Concern

  module ClassMethods
    def for_year(user, date=Time.zone.now)
      self.where("date_from >= ? and date_from <= ? and user_id = ?", date.beginning_of_year, date.end_of_year, user)
    end

    def yearly_budget(user, date=Time.zone.now)
      self.for_year(user, date).map(&:budget).reduce(:+) || 0.00
    end

    def remaining_yearly_budget(user)
      self.yearly_budget(user)-Itinerary.total_yearly_estimated_cost(user)
    end
  end

end
