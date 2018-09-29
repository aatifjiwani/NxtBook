class BoughtBooksController < ApplicationController
  before_action :verify_user_id, only: [:create, :index]
  before_action :verify_sold_book_id, only: [:create]
  before_action :verify_book_id, only: [:show]

  def index
    filter = params[:filter]
    if filter == "search" 
      #to be implemented later
    else
      books = @user.bought_books.recent
      render json: {
        book: books
      }, status: :ok
    end
  end

  def create
    book = @user.bought_books.new(bought_book_params(@sold_book.as_json))
    @sold_book.destroy
    book.save
    render_resource(book)
  end

  def show
    render_resource(@book)
  end
  
  def bought_book_params(sold_book)
    ["id", "updated_at", "created_at", "user_id"].each { |k| sold_book.delete(k) }
    sold_book
  end

  def verify_sold_book_id
    @sold_book = SoldBook.find_by(id: params[:sold_book])
    if @sold_book.nil?
      respond_with_error("Invalid Book ID")
    end
  end
  
  def verify_book_id
    @book = BoughtBook.find_by(id: params[:id])
    if @book.nil?
      respond_with_error("Invalid Book ID")
    end
  end
end
