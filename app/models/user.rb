class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save :create_username
  
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist
  
  validates :username, uniqueness: true
  
  has_many :sold_books
  has_many :bought_books
  
  def create_username
    fullname = "#{self.firstname.downcase}#{self.lastname.downcase}"
    temp_username = fullname
    
    count = 1
    
    while User.find_by(username: temp_username).present? do
      temp_username = "#{fullname}#{count}"
      count = count + 1
    end
    
    self.username = temp_username
  end
end
