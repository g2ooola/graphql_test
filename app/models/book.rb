class Book < ApplicationRecord
  # has_many :stores_books
  # has_many :stores, through: :stores_books
  belongs_to :store
  belongs_to :user
  belongs_to :publishing_house
end
