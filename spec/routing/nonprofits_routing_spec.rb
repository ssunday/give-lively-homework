require 'rails_helper'

RSpec.describe NonprofitsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/nonprofits').to route_to('nonprofits#index')
    end

    it 'routes to #update via PUT' do
      expect(put: '/nonprofits/1').to route_to('nonprofits#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/nonprofits/1').to route_to('nonprofits#update', id: '1')
    end
  end
end
