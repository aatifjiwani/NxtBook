FactoryBot.define do
  factory :user do
    password {'password'}
    
    # sequence(:username) { |n| "demouser#{n}" }
    sequence(:email) { |n| "demouser#{n}@example.com" }
  end
end
