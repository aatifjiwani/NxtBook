require 'rails_helper'

RSpec.describe 'Bought Books', type: :request do
  context "with an existing user and sold books" do
    let! (:user) {create(:user)}
    let! (:token) { Rails.application.credentials.dig(:api_token) }
    let! (:book) { create(:sold_book, user: user) }
    
    describe "buying a book" do
      it 'does not create a book with no user id' do
        url = '/bought_books'
        params = {
          token: token,
          sold_book: book.id
          }

        post url, params: params
        expect(response.status).to eq(400)
        expect(response.body).to eq({
          error: "Invalid User ID"
          }.to_json)
      end
      
      it 'does not create a book with invalid book params' do
        url = '/bought_books'
        params = {
          token: token,
          user_id: user.id,
          sold_book: 0
          }

        post url, params: params
        expect(response.status).to eq(400)
        expect(response.body).to eq({
          error: "Invalid Book ID"
          }.to_json)
      end

      it 'creates a book' do
        url = '/bought_books'
        params = {
          token: token,
          user_id: user.id,
          sold_book: book.id
          }

        post url, params: params
        expect(response.status).to eq(200)
        expect(response.body).to eq(BoughtBook.first.to_json)
        expect(SoldBook.count).to eq(0)
        expect(BoughtBook.count).to eq(1)
      end
    end
    
    context "with already bought books" do
      let!(:first_book) { create(:bought_book, user: user) }
      let!(:second_book) { create(:bought_book, user: user) }
      
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
end