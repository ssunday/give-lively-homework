class Nonprofit < ApplicationRecord
  has_many :check_transactions, dependent: :nullify
  has_many :donations, dependent: :nullify

  scope :alphabetical, -> { order(name: :desc) }

  validates :name, :city, :state, presence: true

  def draft_check_transaction
    check_transactions.draft.first
  end
end
