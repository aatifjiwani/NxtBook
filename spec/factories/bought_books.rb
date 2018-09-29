FactoryBot.define do
  factory :bought_book do
    sequence(:title) { |n| "Book#{n}" }
    sequence(:author) { |n| "Author#{n}" }
    
    isbn {"1234567898765"}
    price {5.99}
    condition {4}
    user
    coverphoto {'https://image.shutterstock.com/image-vector/sample-red-square-grunge-stamp-260nw-338250266.jpg'}
  end
end
