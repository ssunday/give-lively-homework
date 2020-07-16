require 'rails_helper'
require 'check/check_service'

RSpec.describe Check::CheckService do
  let(:check_client) { double }
  let(:check_service) { described_class.new(check_client) }

  let(:nonprofit) do
    Nonprofit.create!(
      name: 'Nonprofit A',
      city: 'City',
      state: 'IL'
    )
  end

  describe '#create_check' do
    let(:check_transaction) { CheckTransaction.create!(nonprofit: nonprofit) }

    it 'calls to check client' do
      expect(check_client).to receive(:create_check).with(
        description: "#{check_transaction.nonprofit.name} - ",
        amount: check_transaction.amount,
        recipient: check_transaction.nonprofit
      )

      check_service.create_check(check_transaction)
    end

    it 'updates check transaction to sent' do
      expect(check_client).to receive(:create_check).and_return(nil)

      check_service.create_check(check_transaction)

      check_transaction.reload

      expect(check_transaction.status).to eq('sent')
      expect(check_transaction.initiated_at.to_date).to eq(Time.zone.today)
    end
  end
end
