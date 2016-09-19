require 'csv'

filename = 'db/hwlibrary.csv'

book_array = CSV.read(filename)
book_array_no_empties = book_array.reject { |c| c.empty? }
all_category_names = []

book_array_no_empties.each_with_index do |book, index|
  book_no_empties = book.reject { |c| c.empty? }
  categories_for_book =  book_no_empties.drop(3)
  categories_for_book.each do |category|
    category.strip!
    unless all_category_names.include? category
      all_category_names << category
    end
  end
  Book.create!(title: book_no_empties[0], number: book_no_empties[1], author: book_no_empties[2], description: "", categories: book_no_empties.drop(3).map{|category| category.strip}, available: true, checked_out_by: "")
end

all_category_names.each do |c|
  Category.create!(name: c)
end

# User.create!(name: "Admin User", email: "admin@admin.com", password: "adminpassword", password_confirmation: "adminpassword", admin: true)
# User.create!(name: "User", email: "user@user.com", password: "userpassword", password_confirmation: "userpassword", admin: false)
