class Nonprofit < ApplicationRecord
  has_many :check_transactions, dependent: :nullify
  has_many :donations, dependent: :nullify

  validates :name, :city, :state, presence: true
end
