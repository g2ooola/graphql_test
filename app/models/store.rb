require 'securerandom'
class Store < ApplicationRecord
  include InitSecret
  # has_many :stores_books
  has_many :books
  enum grade: { general: 0, good: 1, best: 2}

  
end
