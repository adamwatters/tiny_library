class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :number, presence: true, uniqueness: true

  def self.filter(filter)
    where("'#{filter}' = ANY (categories)")
  end

  def self.search(search)
    where("title ILIKE ? OR author ILIKE ?", "%#{search}%", "%#{search}%")
  end

end
