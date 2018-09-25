require 'rails_helper'

RSpec.describe 'With invalid API Token', type: :request do
  let(:user) { create(:user) }
  let(:url) { '/login' }
  let(:params) do
    {
      token: 'invalidtoken',
      user: {
        email: user.email,
        password: user.password
      }
    }
  end
  
  context 'when api token is invalid' do
    it 'returns unauthorized response' do
      post url, params: params
      
      expect(response).to have_http_status(401)
      expect(response.body).to eq({
        status: "error",
        message: "API Token is Invalid"
        }.to_json)
    end
  end
end

RSpec.describe 'POST /login', type: :request do
  let(:user) { create(:user) }
  let(:token) { Rails.application.credentials.dig(:api_token) }
  let(:url) { '/login' }
  let(:params) do
    {
      token: token,
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  context 'when params are correct' do
    before do
      post url, params: params
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns JTW token in authorization header' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns valid JWT token' do
      token = response.headers["Authorization"].split(' ')[1]
      decoded_token = JWT.decode(token, Rails.application.credentials.dig(:jwt_secret_key))
      expect(decoded_token.first['sub'].to_i).to eq(user.id)
    end
  end

  context 'when login params are incorrect' do
    before { post url }
    
    it 'returns unathorized status' do
      expect(response.status).to eq 401
    end
  end
end

RSpec.describe 'DELETE /logout', type: :request do
  let(:url) { '/logout' }

  it 'returns 204, no content' do
    delete url
    expect(response).to have_http_status(204)
  end
end