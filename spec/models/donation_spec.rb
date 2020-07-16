require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe 'associations' do
    it { should belong_to(:nonprofit) }
  end

  describe 'validations' do
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:initiated_at) }
  end
end
