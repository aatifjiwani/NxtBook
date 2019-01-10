class SellingBook < ApplicationRecord
  belongs_to :user
  
  validates :author, presence: true
  validates :title, presence: true
  validates :isbn, presence: true
  validates :condition, presence: true
  validates :price, presence: true
  validates :edition, presence: true
  
  validates :user, presence: true
  
  scope :recent, -> { all.order(created_at: :desc) }
end
