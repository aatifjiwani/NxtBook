require 'rails_helper'

RSpec.describe 'Book Transactions', type: :request do
  context "with two existing users" do
    let! (:buyer) {create(:user)}
    let! (:seller) {create(:user)}
    let! (:token) { Rails.application.credentials.dig(:api_token) }

    
    describe "securing a book that is being sold" do
      let! (:selling_book) {create(:selling_book, user: seller)}
      
      it 'does not do any transaction with the wrong type' do
        url = '/transactions'
        params = {
          token: token,
          type: 'invalid',
          user_id: buyer.id
        }
        
        get url, params: params
        expect(response.status).to eq(400)
        expect(response.body).to eq({
          error: "Invalid transaction"
          }.to_json)
      end
      
      it 'transaction secures selling book into sold and pending' do
        expect(SellingBook.count).to eq(1)
        expect(PendingBook.count).to eq(0)
        expect(SoldBook.count).to eq(0)
        
        book_title = SellingBook.first.title
        book_author = SellingBook.first.author
        
        url = '/transactions'
        params = {
          token: token,
          type: "secure",
          user_id: buyer.id,
          selling_book_id: selling_book.id
        }
        
        get url, params: params
        expect(response.status).to eq(200)
        
        expect(SellingBook.count).to eq(0)
        expect(PendingBook.count).to eq(1)
        expect(SoldBook.count).to eq(1)
                
        expect(buyer.pending_books.first.title).to eq(book_title)
        expect(buyer.pending_books.first.sold_book.title).to eq(book_title)
      end
    end
    
    describe "completing and cancelling a purchase" do
      let! (:sold_book) {create(:sold_book, user: seller)}
      let! (:pending_book) {create(:pending_book, title: sold_book.title, author: sold_book.author, user: buyer, sold_book: sold_book)}
      
      it 'completes a purchase' do
        title = sold_book.title
        
        expect(SellingBook.count).to eq(0)
        expect(PendingBook.count).to eq(1)
        expect(SoldBook.count).to eq(1)
        expect(BoughtBook.count).to eq(0)
        
        expect(buyer.pending_books.first.title).to eq(seller.sold_books.first.title)
        
        expect(buyer.pending_books.first.sold_book.title).to eq(seller.sold_books.first.title)
        
        url = '/transactions'
        params = {
          token: token,
          type: "complete",
          user_id: buyer.id,
          pending_book_id: pending_book.id
        }
        
        get url, params: params
        expect(response.status).to eq(200)
        
        expect(SellingBook.count).to eq(0)
        expect(PendingBook.count).to eq(0)
        expect(SoldBook.count).to eq(0)
        expect(BoughtBook.count).to eq(1)
        
        expect(buyer.bought_books.first.title).to eq(title)
        expect(seller.bought_books.count).to eq(0)
      end
      
      it 'cancels a purchase' do
        title = sold_book.title
        
        expect(SellingBook.count).to eq(0)
        expect(PendingBook.count).to eq(1)
        expect(SoldBook.count).to eq(1)
        expect(BoughtBook.count).to eq(0)
        
        url = '/transactions'
        params = {
          token: token,
          type: "cancel",
          user_id: buyer.id,
          pending_book_id: pending_book.id
        }
        
        get url, params: params
        expect(response.status).to eq(200)
        
        expect(SellingBook.count).to eq(1)
        expect(PendingBook.count).to eq(0)
        expect(SoldBook.count).to eq(0)
        expect(BoughtBook.count).to eq(0)
        
        expect(seller.selling_books.first.title).to eq(title)
        expect(buyer.selling_books.count).to eq(0)
      end
    end
  end
end