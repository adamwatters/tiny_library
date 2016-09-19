class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :number, presence: true, uniqueness: true
  validates :description, length: {maximum: 255}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :checked_out_by, presence: true, unless: :available, length: {maximum: 255},
    format: { with: VALID_EMAIL_REGEX }

  def self.checked_out_search()
    where("available = false")
  end

  def self.category_search(category)
    where("'#{category}' = ANY (categories)")
  end

  def self.author_search(author)
    where("author ILIKE ?", "%#{author}%")
  end

  def self.title_search(title)
    where("title ILIKE ?", "%#{title}%")
  end

  def self.to_csv
    CSV.generate do |csv|
      column_names = %w(number title author categories description)
      csv << column_names
      all.sort_by{|e| e[:number]}.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end

end
