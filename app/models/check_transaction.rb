class CheckTransaction < ApplicationRecord
  enum status: { draft: 0, sent: 1, processed: 2 }

  belongs_to :nonprofit

  has_many :check_transactions_donations, dependent: :destroy
  has_many :donations, through: :check_transactions_donations
end
