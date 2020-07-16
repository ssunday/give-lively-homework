require 'rails_helper'

RSpec.describe CheckTransactionsController, type: :routing do
  describe 'routing' do
    it 'routes to #send_check' do
      expect(post: '/check_transactions/send_check').to route_to('check_transactions#send_check')
    end
  end
end
