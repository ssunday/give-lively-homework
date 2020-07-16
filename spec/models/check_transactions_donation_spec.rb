require 'rails_helper'

RSpec.describe CheckTransactionsDonation, type: :model do
  describe 'associations' do
    it { should belong_to(:check_transaction) }
    it { should belong_to(:donation) }
  end
end
