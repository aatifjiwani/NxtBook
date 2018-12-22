class SoldBooksController < ApplicationController
  before_action :verify_user_id, only: [:create, :update, :destroy]
  before_action :verify_book_id, only: [:show, :update, :destroy]
  
  def index
    filter = params[:filter]
    if filter == "search"
      #to be implemented laterx
    else
      books = SoldBook.recent
      render json: {
        book: books
        }, status: :ok
    end
  end
  
  def create
    type = params[:type]
    if type == "resell"
      verify_bought_book_id
      book = @user.sold_books.new(sold_book_params(@bought_book.as_json))
      @bought_book.destroy
    else
      book = @user.sold_books.new(book_params)
    end
    
    book.save
    render_resource(book)
  end
  
  def show
    render_resource(@book)
  end
  
  def update
    if @book.update(book_params)
      render_resource(@book)
    else
      respond_with_error("Unable to update book")
    end
  end 
  
  def destroy
    if @book.destroy
      respond_destroy_success
    else
      respond_with_error("Unable to delete book")
    end
  end
  
  def sold_book_params(bought_book)
    ["id", "updated_at", "created_at", "user_id"].each { |k| bought_book.delete(k) }
    bought_book
  end
  
  def verify_bought_book_id
    @bought_book = BoughtBook.find_by(id: params[:bought_book])
    if @bought_book.nil?
      respond_with_error("Invalid Book ID")
    end
  end
  
  def verify_book_id
    @book = SoldBook.find_by(id: params[:id])
    if @book.nil?
      respond_with_error("Invalid Book ID")
    end
  end
  
  private
  def book_params
    params.require(:sold_book).permit(:title, :author, :isbn, :price, :condition, :coverphoto, :edition)
  end
end
