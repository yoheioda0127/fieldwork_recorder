FactoryBot.define do
  factory :user do
    name                  { Faker::Lorem.sentence(30) }
    email                 { Faker::Internet.free_email}
    password              { Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    research_theme        { Faker::Lorem.sentence(60) }
    introduction          { Faker::Lorem.characters(150) }
    after(:build) do |user|
      user.avatar.attach(io: File.open('public/sample-avatar.png'), filename: 'sample-avatar.png')
    end
  end
end