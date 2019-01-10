require 'rails_helper'

RSpec.describe 'Pending Books', type: :request do
  context "with an existing user and books" do
    let! (:user) {create(:user)}
    let! (:seller) {create(:user)}
    let! (:token) { Rails.application.credentials.dig(:api_token) }    
    let!(:sold_book1) {create(:sold_book, user: seller)}
    let!(:sold_book2) {create(:sold_book, user: seller)}
    
    let!(:first_book) { create(:pending_book, title: sold_book1.title, author: sold_book1.author, user: user, sold_book: sold_book1) }
    let!(:second_book) { create(:pending_book, user: user, title: sold_book2.title, author: sold_book2.author, sold_book: sold_book2) }
      
    it 'responds with error with invalid book id' do
      url = "/pending_books/0"
      get url, params: {
        token: token
      }

      expect(response.status).to eq(400)
    end
    
    it 'shows all the books' do
      url = '/pending_books'
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
      url = "/pending_books/#{first_book.id}"
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