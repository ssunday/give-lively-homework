class Nonprofit < ApplicationRecord
  has_many :donations, dependent: :nullify

  validates :name, :city, :state, presence: true
end
