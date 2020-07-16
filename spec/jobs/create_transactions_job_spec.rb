require 'rails_helper'

RSpec.describe CreateTransactionsJob, type: :job do
  let!(:nonprofit1) { Nonprofit.create!(name: 'Nonprofit B', city: 'City', state: 'IL') }
  let!(:nonprofit2) { Nonprofit.create!(name: 'Nonprofit B', city: 'City', state: 'IL') }
  let!(:nonprofit3) { Nonprofit.create!(name: 'Nonprofit B', city: 'City', state: 'IL') }

  let(:start_date) { Time.now.utc - 1.month }
  let(:end_date) { Time.now.utc }

  it 'creates draft transactions for each nonprofit with donations in time period' do
    Donation.create!(
      nonprofit: nonprofit2,
      initiated_at: start_date,
      processed_at: start_date - 1.day,
      amount: 15.22
    )
    Donation.create!(
      nonprofit: nonprofit2,
      initiated_at: start_date,
      processed_at: end_date - 1.day,
      amount: 12.25
    )
    Donation.create!(
      nonprofit: nonprofit2,
      initiated_at: start_date,
      processed_at: start_date + 1.day,
      amount: 33.45
    )
    Donation.create!(
      nonprofit: nonprofit1,
      initiated_at: start_date,
      processed_at: end_date - 5.days,
      amount: 21.5
    )

    Donation.create!(
      nonprofit: nonprofit1,
      initiated_at: start_date,
      processed_at: end_date + 10.days,
      amount: 100
    )

    described_class.perform_now(start_date, end_date)

    expect(CheckTransaction.count).to eq(2)
    expect(CheckTransaction.draft.count).to eq(2)
    expect(nonprofit2.check_transactions.first.amount).to eq(45.70)
    expect(nonprofit1.check_transactions.first.amount).to eq(21.50)
  end
end
