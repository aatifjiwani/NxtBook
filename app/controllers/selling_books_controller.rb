class SellingBooksController < ApplicationController
  before_action :verify_user_id, only: [:create, :update, :destroy]
  before_action :verify_book_id, only: [:show, :update, :destroy]
  
  def index
    filter = params[:filter]
    if filter == "search"
      #to be implemented later
    else
      books = SellingBook.recent
      render json: {
        book: books
        }, status: :ok
    end
  end
  
  def create
    book = @user.selling_books.new(book_params)
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
  
  def verify_book_id
    @book = SellingBook.find_by(id: params[:id])
    if @book.nil?
      respond_with_error("Invalid Book ID")
    end
  end
  
  private
  def book_params
    params.require(:selling_book).permit(:title, :author, :isbn, :price, :condition, :coverphoto, :edition)
  end
end
