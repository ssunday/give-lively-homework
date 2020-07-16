require 'rails_helper'

RSpec.describe Nonprofit, type: :model do
  describe 'associations' do
    it { should have_many(:donations) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
  end
end
