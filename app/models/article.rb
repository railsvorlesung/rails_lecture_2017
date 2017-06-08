class Article < ApplicationRecord

  validates :title, :body, presence: true
  validates :title, length: {minimum: 5}

  has_many :comments
end
