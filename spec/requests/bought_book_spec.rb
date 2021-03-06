require 'rails_helper'

RSpec.describe 'Bought Books', type: :request do
  context "with an existing user and books" do
    let! (:user) {create(:user)}
    let! (:token) { Rails.application.credentials.dig(:api_token) }    
    let!(:first_book) { create(:bought_book, user: user) }
    let!(:second_book) { create(:bought_book, user: user) }
      
    it 'responds with error with invalid book id' do
      url = "/bought_books/0"
      get url, params: {
        token: token
      }

      expect(response.status).to eq(400)
    end
    
    it 'shows all the books' do
      url = '/bought_books'
      get url, params: {
        token: token,
        user_id: user.id
      }

      expect(response.status).to eq(200)
      expect(response.body).to eq({
        book: [second_book, first_book]
        }.to_json)
    end

    it 'shows a book' do
      url = "/bought_books/#{first_book.id}"
      get url, params: {
        token: token
      }

      expect(response.status).to eq(200)
      expect(response.body).to eq(
        first_book.to_json
        )
    end
  end
end