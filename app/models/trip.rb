class Trip < ActiveRecord::Base
  has_many :itineraries
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true

  class << self
    def ordered_by_name
      self.all.order(:name)
    end
  end

  def to_s
    name
  end
end
