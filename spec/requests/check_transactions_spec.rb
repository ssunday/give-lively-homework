require 'rails_helper'

RSpec.describe '/check_transactions', type: :request do
  let(:nonprofit) do
    Nonprofit.create!(
      name: 'Nonprofit A',
      city: 'City',
      state: 'IL'
    )
  end

  describe 'POST #send_check' do
    let(:check_transaction) { CheckTransaction.create(status: :draft, nonprofit: nonprofit) }

    it 'calls to checks service to create check' do
      expect(Checks.service).to receive(:create_check).with(check_transaction)

      post check_transactions_send_check_url, params: { id: check_transaction.id }, as: :json

      expect(response).to be_successful
    end

    it 'handles errors' do
      expect(Checks.service).to receive(:create_check).with(check_transaction).and_raise(StandardError)

      post check_transactions_send_check_url, params: { id: check_transaction.id }, as: :json

      expect(response).to_not be_successful
    end
  end
end
