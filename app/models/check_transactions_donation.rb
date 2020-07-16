class CheckTransactionsDonation < ApplicationRecord
  belongs_to :check_transaction
  belongs_to :donation
end
