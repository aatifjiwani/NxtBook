require 'rails_helper'

RSpec.describe 'Selling Books', type: :request do
  context "with an existing user" do
    let! (:user) {create(:user)}
    let! (:token) { Rails.application.credentials.dig(:api_token) }
        
    describe "creating a book to sell" do
      it 'does not create a book with no user id' do
        url = '/selling_books'
        params = {
          token: token,
          selling_book: attributes_for(:sold_book)  
        }
        
        post url, params: params
        expect(response.status).to eq(400)
        expect(response.body).to eq({
          error: "Invalid User ID"
          }.to_json)
      end
      
      it 'does not create a book with invalid book params' do
        url = '/selling_books'
        params = {
          token: token,
          user_id: user.id,
          selling_book: {
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
        url = '/selling_books'
        params = {
          token: token,
          user_id: user.id,
          selling_book: attributes_for(:sold_book)  
        }
        
        post url, params: params
        expect(response.status).to eq(200)
        expect(response.body).to eq(SellingBook.first.to_json)
      end
    end
    
    context "with existing books to sell" do
      let!(:first_book) { create(:selling_book, user: user) }
      let!(:second_book) { create(:selling_book, user: user) }
      
      it 'shows all the books' do
        url = '/selling_books'
        get url, params: {
          token: token
        }
        
        expect(response.status).to eq(200)
        expect(response.body).to eq({
          book: [second_book, first_book]
          }.to_json)
      end
      
      it 'shows a book' do
        url = "/selling_books/#{first_book.id}"
        get url, params: {
          token: token
        }
        
        expect(response.status).to eq(200)
        expect(response.body).to eq(
          first_book.to_json
          )
      end
      
      it 'destroys a book' do
        url = "/selling_books/#{first_book.id}"
        delete url, params: {
          token: token,
          user_id: user.id
        }
        
        expect(response.status).to eq(200)
        expect(response.body).to eq(
          {destroy:true}.to_json
          )
        expect(SellingBook.find_by(id: first_book.id)).to be(nil)
      end
      
      it 'updates the book' do
        url = "/selling_books/#{first_book.id}"
        params = {
          token: token,
          user_id: user.id,
          selling_book: {
            title: "New Title"
          }
        }
        
        put url, params: params
        expect(response.status).to eq(200)
        
        new_book = user.selling_books.find(first_book.id)
        
        expect(new_book.title).to eq("New Title")
        
      end
    end
  end
end