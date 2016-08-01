require 'csv'

filename = 'tmp/hwlibrary.csv'

book_array = CSV.read(filename)
book_array_no_empties = book_array.reject { |c| c.empty? }

book_array_no_empties.each_with_index do |book, index|
  book_no_empties = book.reject { |c| c.empty? }
  puts index
  Book.create!(title: book_no_empties[0], number: book_no_empties[1], author: book_no_empties[2], categories: book_no_empties.drop(3))
end

User.create!(name: "Admin User", email: "admin@admin.com", password: "adminpassword", password_confirmation: "adminpassword", admin: true)
User.create!(name: "User", email: "user@user.com", password: "userpassword", password_confirmation: "userpassword", admin: false)
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end
