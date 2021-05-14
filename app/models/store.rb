require 'securerandom'
class Store < ApplicationRecord
  has_many :stores_books
  enum grade: { general: 0, good: 1, best: 2}

  before_create :init_secret

  private

  def init_secret
    self.secret = SecureRandom.hex(10)
  end
end
