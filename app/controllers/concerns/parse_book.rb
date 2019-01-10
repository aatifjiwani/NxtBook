module ParseBook
  def parse_book_from_json(book)
    ["id", "updated_at", "created_at", "user_id", "sold_book_id"].each { |k| book.delete(k) }
    book
  end
end