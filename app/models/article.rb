class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 20, maximum: 100 }
  validates :content, presence: true
  validates :title, uniqueness: true, on: %i[create update]
  has_many :comments
end
