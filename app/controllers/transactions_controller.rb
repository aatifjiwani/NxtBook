class TransactionsController < ApplicationController
  include ParseBook
  
  before_action :verify_user_id, only: [:index]
  
  def index
    type = params[:type]
    if type == "secure"
      verify_selling_book_id
      selling_user = @selling_book.user
      
      book_info = parse_book_from_json(@selling_book.as_json)
      
      sold_book = selling_user.sold_books.new(book_info)
      if !sold_book.save
        respond_with_error("Unable to complete transaction")
      end
      
      pending_book = sold_book.build_pending_book(book_info.merge(user_id: @user.id))
      
      if !pending_book.save
        sold_book.destroy
        respond_with_error("Unable to complete transaction")
      end
      
      @selling_book.destroy
      
      render_resource(pending_book)
      
    elsif type == "complete"
      verify_pending_book_id
      
      book_info = parse_book_from_json(@pend_book.as_json)
      
      completed_user = @pend_book.user
      sold_book = @pend_book.sold_book
            
      bought_book = completed_user.bought_books.new(book_info)
      
      if !bought_book.save
        respond_with_error("Unable to complete transaction")
      end
      
      sold_book.destroy
      
      render_resource(bought_book)
    elsif type == "cancel"
      verify_pending_book_id
      
      book_info = parse_book_from_json(@pend_book.as_json)
      
      cancelled_user = @pend_book.user
      sold_book = @pend_book.sold_book
      sold_user = sold_book.user
      
      selling_book = sold_user.selling_books.new(book_info)
      
      if !selling_book.save
        respond_with_error("Unable to complete transaction")
      end
      
      sold_book.destroy
      
      render_resource(selling_book)
    else
      respond_with_error("Invalid transaction")
    end
  end
  
  
  def verify_selling_book_id
    @selling_book = SellingBook.find_by(id: params[:selling_book_id])
    if @selling_book.nil?
      respond_with_error("Invalid Selling Book ID")
    end
  end
  
  def verify_pending_book_id
    @pend_book = PendingBook.find_by(id: params[:pending_book_id])
    if @pend_book.nil?
      respond_with_error("Invalid Selling Book ID")
    end
  end
end
