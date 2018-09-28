class SoldBooksController < ApplicationController
  before_action :verify_user_id, only: [:create, :update, :destroy]
  
  def index
    filter = params[:filter]
    if filter == "search"
      
    elsif filter == "user"
      verify_user_id
    else
      books = SoldBook.all
    end
  end
  
  def create
  end
  
  def show
  end
  
  def update
  end 
  
  def destroy
  end
  
  private
  def book_params
    params.require(:sold_book).permit(:title, :author, :isbn, :price, :condition)
  end
end
