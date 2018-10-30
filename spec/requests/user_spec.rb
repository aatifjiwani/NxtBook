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
    
    describe 'updating a users info' do
      it 'responds with error with invalid user id' do
        put user_path(0), params: params.merge(id: 0)
        expect(response.status).to eq(400)
        expect(response.body).to eq({
          error: 'Invalid User ID'
          }.to_json
        )
      end
      
      it 'updates their profile picture' do
        put user_path(user), params: params.merge(id: user.id, 
          user: {
              profilepicture: "https://google.com/images/somepicture"
            }
          )
        
        expect(response.status).to eq(200)
        
        expect(User.find(user.id).profilepicture).to eq("https://google.com/images/somepicture")
      end
      
      it 'updates their password' do
        put user_path(user), params: params.merge(id: user.id, 
          user: {
              password: "newpassword",
              password_confirmation: "newpassword"
            }
          )
        
        expect(response.status).to eq(200)
        
        post '/login', params: params.merge(
          user: {
            email: user.email,
            password: 'newpassword'
          }
        )
        
        expect(response).to have_http_status(200)
      end
      
      it 'does not update password with unmatching values' do
        put user_path(user), params: params.merge(id: user.id, 
          user: {
              password: "newpassword",
              password_confirmation: "invalid matching"
            }
          )
        
        expect(response.status).to eq(400)
      end
    end
    
  end
    
  
end