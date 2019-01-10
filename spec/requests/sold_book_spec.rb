require 'rails_helper'

RSpec.describe 'Sold Books', type: :request do
  context "with an existing user and books" do
    let! (:user) {create(:user)}
    let! (:token) { Rails.application.credentials.dig(:api_token) }    
    let!(:first_book) { create(:sold_book, user: user, pending_book: nil) }
    let!(:second_book) { create(:sold_book, user: user, pending_book: nil) }
      
    it 'responds with error with invalid book id' do
      url = "/sold_books/0"
      get url, params: {
        token: token
      }

      expect(response.status).to eq(400)
    end
    
    it 'shows all the books' do
      url = '/sold_books'
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
      url = "/sold_books/#{first_book.id}"
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