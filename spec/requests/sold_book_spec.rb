require 'rails_helper'

RSpec.describe 'Sold Books', type: :request do
  context "with an existing user" do
    let! (:user) {create(:user)}
    let! (:token) { Rails.application.credentials.dig(:api_token) }
    
    describe "creating a book to sell" do
      it 'does not create a book with no user id' do
        url = '/sold_books'
        params = {
          token: token,
          sold_book: attributes_for(:sold_book)  
        }
        
        post url, params: params
        expect(response.status).to eq(400)
        expect(response.body).to eq({
          error: "Invalid User ID"
          }.to_json)
      end
      
      it 'does not create a book with invalid book params' do
        url = '/sold_books'
        params = {
          token: token,
          user_id: user.id,
          sold_book: {
            title: "Example",
            price: 5.99,
            condition: 4,
            isbn: "1234567898765"
          }
        }
        
        post url, params: params
        expect(response.status).to eq(400)
        error = JSON.parse(response.body)["errors"][0]["detail"]
        expect(error["author"][0]).to eq("can't be blank")
      end
      
      it 'creates a book' do
        url = '/sold_books'
        params = {
          token: token,
          user_id: user.id,
          sold_book: attributes_for(:sold_book)  
        }
        
        post url, params: params
        expect(response.status).to eq(200)
        expect(response.body).to eq(SoldBook.first.to_json)
      end
    end
    
    context "with existing books to sell" do
      let!(:first_book) { create(:sold_book, user: user) }
      let!(:second_book) { create(:sold_book, user: user) }
      
      it 'shows all the books' do
        url = '/sold_books'
        get url, params: {
          token: token
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
      
      it 'destroys a book' do
        url = "/sold_books/#{first_book.id}"
        delete url, params: {
          token: token,
          user_id: user.id
        }
        
        expect(response.status).to eq(200)
        expect(response.body).to eq(
          {destroy:true}.to_json
          )
        expect(SoldBook.find_by(id: first_book.id)).to be(nil)
      end
      
      it 'updates the book' do
        url = "/sold_books/#{first_book.id}"
        params = {
          token: token,
          user_id: user.id,
          sold_book: {
            title: "New Title"
          }
        }
        
        put url, params: params
        #binding.pry
        expect(response.status).to eq(200)
        
        new_book = user.sold_books.find(first_book.id)
        
        expect(new_book.title).to eq("New Title")
        
      end
    end
    
    context "with existing bought books" do
      let!(:book) { create(:bought_book, user: user) }
      
      describe "user reselling a book" do
        it 'creates a new book for sale' do
          url = "/sold_books"
          params = {
            token: token,
            user_id: user.id,
            type: "resell",
            bought_book: book.id
          }
          
          post url, params: params
          expect(response.status).to eq(200)
          expect(response.body).to eq(SoldBook.first.to_json)
          expect(BoughtBook.count).to eq(0)
        end
      end
    end
  end
end