require 'rails_helper'

RSpec.describe 'POST /signup', type: :request do
  let(:url) { '/signup' }
  let(:token) { Rails.application.credentials.dig(:api_token) }
  let(:params) do
    {
      token: token,
      user: {
        firstname: 'demo',
        lastname: 'user',
        email: 'user@example.com',
        password: 'password'
      }
    }
  end

  context 'when user is unauthenticated' do
    before { post url, params: params }

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'returns a new user' do
      user = User.first
      expect(user).to have_attributes(email: 'user@example.com', id: user.id)
    end
  end

  context 'when user already exists' do
    before do
      create(:user, email: params[:user][:email])
      post url, params: params
    end

    it 'returns bad request status' do
      expect(response.status).to eq 400
    end

    it 'returns validation errors for email' do
      error = JSON.parse(response.body)["errors"][0]["detail"]
      expect(error["email"][0]).to eq("has already been taken")
    end
  end
  
  context 'when user with same username exists' do    
    it 'creates a numbered username' do
      create(:user, firstname: "first", lastname: "user")
      
      post url, params: {
        token: token,
          user: {
            firstname: 'First',
            lastname: 'User',
            email: 'demo@anotheremail.com',
            password: 'password'
          }
        }
      expect(User.first.username).to eq("firstuser")
      new_user = User.last
      expect(new_user.username).to eq("firstuser1")
    end
  end
end