require 'spec_helper'
require 'check/check_service'

RSpec.describe Check::CheckService do
  let(:check_client) { double }
  let(:check_service) { described_class.new(check_client) }

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

    it 'calls to check client' do
      expect(check_client).to receive(:create_check).with(
        description: description,
        amount: amount,
        recipient: recipient
      )

      check_service.create_check(
        description: description,
        amount: amount,
        recipient: recipient
      )
    end
  end
end
