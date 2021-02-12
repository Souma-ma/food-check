FactoryBot.define do
  factory :food do
    name         {Faker::Food.description}
    calorie      {100}
    protein      {50}
    fat          {20}
    carbohydrate {200}

    after(:build) do |food|
      food.image.attach(io: File.open('public/images/test-img.jpg'), filename: 'test-img.jpg')
    end
  end
end