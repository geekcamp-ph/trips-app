class Trip < ActiveRecord::Base
  validates :name, presence: true
end
