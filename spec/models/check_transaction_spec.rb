require 'rails_helper'

RSpec.describe CheckTransaction, type: :model do
  describe 'associations' do
    it { should belong_to(:nonprofit) }
  end
end
