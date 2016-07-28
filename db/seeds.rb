User.create!(name: "Admin User", email: "admin@admin.com", password: "adminpassword", password_confirmation: "adminpassword", admin: true)
User.create!(name: "User", email: "user@user.com", password: "userpassword", password_confirmation: "userpassword", admin: false)
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end
