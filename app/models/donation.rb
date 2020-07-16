class Donation < ApplicationRecord
  belongs_to :nonprofit

  validates :amount, :initiated_at, presence: true
end
