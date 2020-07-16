class Nonprofit < ApplicationRecord
  validates :name, :city, :state, presence: true
end
