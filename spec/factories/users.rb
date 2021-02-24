FactoryBot.define do
  factory :article do
    name                  { Faker::Book.title(30) }
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    reserch_theme         { Faker::Lorem.characters(170) }
    introduction          { Faker::Lorem.characters(170) }

    after(:build) do |user|
      user.avatar.attach(io: File.open('public/sample-avatar.png'), filename: 'sample-avatar.png')
    end

  end
end