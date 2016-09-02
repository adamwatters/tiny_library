require 'csv'

filename = 'db/hwlibrary.csv'

book_array = CSV.read(filename)
book_array_no_empties = book_array.reject { |c| c.empty? }

book_array_no_empties.each_with_index do |book, index|
  book_no_empties = book.reject { |c| c.empty? }
  Book.create!(title: book_no_empties[0], number: book_no_empties[1], author: book_no_empties[2], categories: book_no_empties.drop(3), available: true, checked_out_by: "")
end

User.create!(name: "Admin User", email: "admin@admin.com", password: "adminpassword", password_confirmation: "adminpassword", admin: true)
User.create!(name: "User", email: "user@user.com", password: "userpassword", password_confirmation: "userpassword", admin: false)
