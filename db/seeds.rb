# adminユーザーのサンプル設定
User.create!(name:  "Riho Okubo",
             email: "rihoohkubo1002@gmail.com",
             password:              "rihoriho",
             password_confirmation: "rihoriho",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

# 99人分のサンプルユーザー
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

#relationshipsのサンプル
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }