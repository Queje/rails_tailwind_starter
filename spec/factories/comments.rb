FactoryBot.define do
    factory :comment do  
      user_name { Faker::FunnyName.name } 
      body { Faker::Lorem.paragraph_by_chars(number: 99, supplemental: false) }
    end
  end