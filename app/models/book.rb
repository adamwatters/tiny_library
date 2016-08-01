class Book < ApplicationRecord
  serialize :categories, Array
  validates :title, presence: true
end
