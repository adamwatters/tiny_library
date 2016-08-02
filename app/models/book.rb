class Book < ApplicationRecord
  serialize :categories, Array
  validates :title, presence: true
  validates :author, presence: true
  validates :number, presence: true, uniqueness: true

  def self.search(search)
    where("title iLIKE ?", "%#{search}%")
    where("author iLIKE ?", "%#{search}%")
  end

end
