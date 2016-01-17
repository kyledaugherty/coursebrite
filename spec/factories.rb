FactoryGirl.define do
  sequence(:email) { |n| "user-#{n}@example.com" }

  factory :course do
    title "A title"
  end

  factory :user do
    email
    password "password123"
  end
end
