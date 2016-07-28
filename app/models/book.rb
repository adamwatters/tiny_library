class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, length: {is: 10}, uniqueness:true, numericality: true
end
