FactoryBot.define do
  factory :article do
    title            { Faker::Book.title(30) }
    activity_date    { Faker::Date.between(from: '1930-01-01', to: Date.today) }
    weather_id       { Faker::Number.between(from: 1, to: 15) }
    location         { Faker::Mountain.name(45) }
    appeal_point     { Faker::Lorem.characters(120) }
    memo             { Faker::Lorem.characters(170) }
    association      :user

    after(:build) do |article|
      article.top_image.attach(io: File.open('public/sample-avatar.png'), filename: 'sample-avatar.png')
    end

  end
end