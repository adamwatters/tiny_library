require 'csv'

filename = 'tmp/hwlibrary.csv'

book_array = CSV.read(filename)
book_array_no_empties = book_array.reject { |c| c.empty? }

book_array_no_empties.each do |book|
  book_no_empties = book.reject { |c| c.empty? }
  puts book
  Book.create!(title: book[0], number: book[1], author: book[2], categories: book.drop(3))
end

User.create!(name: "Admin User", email: "admin@admin.com", password: "adminpassword", password_confirmation: "adminpassword", admin: true)
User.create!(name: "User", email: "user@user.com", password: "userpassword", password_confirmation: "userpassword", admin: false)
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end
