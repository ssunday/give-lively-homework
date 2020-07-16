require 'rails_helper'

RSpec.describe '/nonprofits', type: :request do
  let(:valid_attributes) do
    {
      name: 'Nonprofit A',
      city: 'City',
      state: 'IL'
    }
  end

  let(:invalid_attributes) do
    {
      name: '',
      city: ''
    }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Nonprofit.create! valid_attributes
      get nonprofits_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'PATCH /update' do
    let(:nonprofit) { Nonprofit.create!(valid_attributes) }

    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'Nonprofit Test A',
          city: 'City',
          state: 'CA'
        }
      end

      it 'updates the requested nonprofit address only' do
        patch nonprofit_url(nonprofit),
              params: { nonprofit: new_attributes },
              headers: valid_headers, as: :json

        nonprofit.reload

        expect(nonprofit.name).to eq('Nonprofit A')
        expect(nonprofit.state).to eq('CA')
      end

      it 'renders a JSON response with the nonprofit' do
        patch nonprofit_url(nonprofit),
              params: { nonprofit: new_attributes }, headers: valid_headers, as: :json

        expect(response).to have_http_status(:no_content)
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the nonprofit' do
        patch nonprofit_url(nonprofit),
              params: { nonprofit: invalid_attributes }, headers: valid_headers, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end
end
