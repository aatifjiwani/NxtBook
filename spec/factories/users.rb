FactoryBot.define do
  factory :user do
    password {'password'}
    password_confirmation {'password'}
    
    profilepicture {""}
    
    sequence(:firstname) { |n| "Demo#{n}"}
    sequence(:lastname) { |n| "User#{n}" }
    sequence(:email) { |n| "demouser#{n}@example.com" }
  end
end
