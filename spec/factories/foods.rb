FactoryBot.define do
  factory :food do
    name         {Faker::Food.description}
    calorie      {100}
    protein      {50.0}
    fat          {20.0}
    carbohydrate {200.0}

    after(:build) do |food|
      food.image.attach(io: File.open('public/images/test-img.jpg'), filename: 'test-img.jpg')
    end
  end
end