FactoryBot.define do
  factory :idea do  
    name { Faker::FunnyName.name } 
    description { Faker::Lorem.paragraph_by_chars(number: 99, supplemental: false) }
  end
end