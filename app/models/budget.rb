class Budget < ActiveRecord::Base

  belongs_to :user

  validates :budget, presence: true
  validates :date_from, presence: true
  validates :date_to, presence: true
  validate :time_uniqueness, on: :create
  validates :user_id, presence: true

  class << self
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

  private

  def time_uniqueness
    if Budget.where(['date_from >= ? OR date_to >= ? AND user_id = ?', date_from, date_to, self.user.id]).size > 0
      errors[:base] << "Please choose different dates. It seems like you have already set a budget for those dates."
    end
  end
end
