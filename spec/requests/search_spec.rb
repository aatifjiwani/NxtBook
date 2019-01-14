require 'rails_helper'

RSpec.describe 'Searching for Books', type: :request do
  context "with existing books" do
    let!(:seller) {create(:user)}
    
    let!(:book_one) {create(:selling_book, title: "Fundamentals of Cognitive Science", author: "Kaavya Singhal", isbn: "1234567890", user: seller)}
    
    let!(:book_two) {create(:selling_book, title: "Computer Science Principles", author: "Aatif Jiwani", isbn: "2345678901234", edition: "5th", price: 6.99, user: seller)}
    
    let!(:book_three) {create(:selling_book, title: "Computer Science Principles", author: "Suyash Pandey", isbn: "5678901234567", edition: "3rd", price: 2.99, user: seller)}
    
    let! (:token) { Rails.application.credentials.dig(:api_token) }
    
    describe "searching for a book with the ISBN" do
      
      it 'returns no book with an unfound ISBN' do
        url = '/search'
        params = {
          token: token,
          query: "9090909090909"
        }
        
        get url, params: params
        expect(response.status).to eq(200)
        expect(response.body).to eq({
          books: []
        }.to_json)
      end
      
      it 'returns a book with a valid ISBN' do
        url = '/search'
        params = {
          token: token,
          query: "1234567890"
        }
        
        get url, params: params
        expect(response.status).to eq(200)
        expect(response.body).to eq({
          books: [book_one.as_json]
        }.to_json)
      end
      
    end
    
  end
end