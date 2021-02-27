FactoryBot.define do
  factory :article do
    title            { Faker::Lorem.sentence(30) }
    activity_date    { Faker::Date.between(from: '1930-01-01', to: Date.today) }
    weather_id       { Faker::Number.between(from: 1, to: 15) }
    location         { Faker::Mountain.name }
    appeal_point     { Faker::Lorem.sentence(120) }
    memo             { Faker::Lorem.sentence(170) }
    association      :user
    after(:build) do |article|
      article.top_image.attach(io: File.open('public/kayou.png'), filename: 'kayou.png')
    end
  end
end