10.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "a025987"
  encrypted_password = "a025987"
  major_id = 1
  research_theme = "テスト"
  introduction = "テスト"

  User.create!(
    name: name,
    email: email,
    password: password,
    encrypted_password: encrypted_password,
    major_id: major_id,
    research_theme: research_theme,
    introduction: introduction
  )
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

