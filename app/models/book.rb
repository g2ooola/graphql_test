class Book < ApplicationRecord
  has_many :stores_books
  belongs_to :user
end
