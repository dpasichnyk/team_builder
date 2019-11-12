FactoryBot.define do
  factory :department do
    transient do
      sequence :n
    end

    name { "Awesome dept. ##{n}" }
    description { "Employees are not smiling in department ##{n}" }

    trait :with_users do
      after :build do |dept|
        dept.users << create_list(:user, 3)
      end
    end
  end
end