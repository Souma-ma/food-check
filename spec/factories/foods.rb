FactoryBot.define do
  factory :food do
    name         { Faker::Food.description }
    calorie      { 100 }
    protein      { 21.2 }
    fat          { 2.5 }
    carbohydrate { 51.0 }

    after(:build) do |food|
      food.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
