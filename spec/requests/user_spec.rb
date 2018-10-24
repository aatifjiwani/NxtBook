require 'rails_helper'

RSpec.describe 'GET /users', type: :request do
  context 'with existing users' do
    let(:user) {create(:user)}
    let(:token) { Rails.application.credentials.dig(:api_token) }

    let(:params) do
      {
        token: token
      }
    end
        
    it 'responds with error with invalid user id' do
      get user_path(0), params: params.merge(id: 0)
      expect(response.status).to eq(400)
      expect(response.body).to eq({
        error: 'Invalid User ID'
        }.to_json
      )
    end
    
    it 'responds with user with valid user id' do
      get user_path(user), params: params.merge(id: user.id)
      expect(response.status).to eq(200)
      expect(response.body).to eq(user.to_json)
    end
  end
    
  
end