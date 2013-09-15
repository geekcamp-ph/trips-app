class Trip < ActiveRecord::Base
  has_many :itineraries
  validates :name, presence: true

  def to_s
    name
  end
end
