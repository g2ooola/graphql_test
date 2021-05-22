class User < ApplicationRecord
  include InitSecret
  has_many :books
  has_many :coupons
end
