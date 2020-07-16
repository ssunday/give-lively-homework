require 'spec_helper'
require 'check/lob_client'

RSpec.describe Check::LobClient do
  let(:lob_client) { described_class.new }

  describe '#create_check' do
    let(:description) { 'Foobar' }
    let(:amount) { 100.50 }
    let(:recipient) do
      double(
        name: 'Joe Bob',
        address_1: '14 Lane',
        address_2: nil,
        city: 'San Tester',
        state: 'CA',
        zip: '12312321'
      )
    end

    it 'creates a check using lob api client' do
      check_dbl = double
      expect_any_instance_of(Lob::Client).to receive(:checks).and_return(check_dbl)
      expect(check_dbl).to receive(:create) do |args|
        expect(args[:description]).to eq(description)
        expect(args[:amount]).to eq(amount)
        expect(args[:from]).to_not be_nil
        expect(args[:to]).to eq(
          name: recipient.name,
          address_line1: recipient.address_1,
          address_line2: nil,
          address_city: recipient.city,
          address_state: recipient.state,
          address_zip: recipient.zip
        )
        expect(args[:bank_account]).to_not be_nil
      end

      lob_client.create_check(
        description: description,
        amount: amount,
        recipient: recipient
      )
    end
  end
end
