class SearchController < ApplicationController
  
  def index
    
    query = params[:query]
    
    if query.nil?
      render json: {
        books: SellingBook.recent.as_json
        }, status: :ok
    
    elsif contains_isbn(query)
      
      books = SellingBook.where(isbn: query)
      
      render json: {
            books: books.as_json
        }, status: :ok
    else
      
      edition = params[:edition]
      price_low = params[:price_low]
      price_high = params[:price_high]
      cond = params[:condition]
      
      books = SellingBook.search_by(query).records.all
      
      if edition.present? 
        books = books.where(edition: edition)
      end
      
      if price_low.present?
        low = price_low.to_d
        books = books.where("price >= #{low}")
      end
      
      if price_high.present?
        high = price_high.to_d
        books = books.where("price <= #{high}")
      end
      
      if cond.present?
        books = books.where("condition >= #{cond}")
      end
      
      render json: {
        books: books.as_json
        }, status: :ok
    end
  end
  
  def contains_isbn(query)
    length = query.length
    only_digits = query.scan(/\D/).empty?
    return ((length == 10 or length == 13) and only_digits)
  end
end
