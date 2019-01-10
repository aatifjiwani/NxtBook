class PendingBooksController < ApplicationController
  before_action :verify_book_id, only: [:show]
  before_action :verify_user_id, only: [:index]

  def index
    books = @user.pending_books.recent
    render json: {
      book: books
    }, status: :ok
  end
  
  def show
    render_resource(@book)
  end
  
  def verify_book_id
    @book = PendingBook.find_by(id: params[:id])
    if @book.nil?
      respond_with_error("Invalid Book ID")
    end
  end
end
