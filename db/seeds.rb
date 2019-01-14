# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seller = User.create(email: 'hella@gmail.com', firstname: "Hella", lastname: "Cool", password: "password", password_confirmation: "password")

SellingBook.create(
  [
    { title: "Fundamentals Accounting",
      author: "Kaavya Singhal",
      isbn: "12345678901",
      price: 4.99,
      edition: "4th",
      condition: 4,
      coverphoto: "https://image.shutterstock.com/image-vector/sample-red-square-grunge-stamp-260nw-338250266.jpg",
      user: seller
    }, 
    {
      title: "Principles of Calculus",
      author: "Aatif Jiwani",
      isbn: "3456789012",
      price: 4.99,
      edition: "2nd",
      condition: 4,
      coverphoto: "https://image.shutterstock.com/image-vector/sample-red-square-grunge-stamp-260nw-338250266.jpg",
      user: seller
    },
    {
      title: "Physics for Scientists and Engineers",
      author: "Nikhil Cukkemane",
      isbn: "5678901234",
      price: 4.99,
      edition: "4th",
      condition: 4,
      coverphoto: "https://image.shutterstock.com/image-vector/sample-red-square-grunge-stamp-260nw-338250266.jpg",
      user: seller  
    }
  ]
)
