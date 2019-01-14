class SellingBook < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  belongs_to :user
  
  validates :author, presence: true
  validates :title, presence: true
  validates :isbn, presence: true
  validates :condition, presence: true
  validates :price, presence: true
  validates :edition, presence: true
  
  validates :user, presence: true
  
  scope :recent, -> { all.order(created_at: :desc) }
  
  def as_indexed_json(options = {})
    self.as_json(
      only: [:title, :author]
    )
  end

  def self.search_by(searchquery)
    self.__elasticsearch__.search(
    query: {
      multi_match: {
        query: searchquery,
        fields: ['title', 'author']
        }
      }
    )
  end
end