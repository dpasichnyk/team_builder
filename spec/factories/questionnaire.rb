FactoryBot.define do
  factory :questionnaire do

    ends_at { 3.hours.from_now }

    trait :with_users do
      after :build do |user|
        user.users << create_list(:user, 3)
      end
    end
  end
end