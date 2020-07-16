class Donation < ApplicationRecord
  belongs_to :nonprofit

  has_many :check_transactions_donations, dependent: :destroy

  validates :amount, :initiated_at, presence: true
end
