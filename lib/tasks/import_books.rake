require 'elasticsearch/rails/tasks/import'

desc "Import new book data"

task import_books: :environment do
  SellingBook.import()
end