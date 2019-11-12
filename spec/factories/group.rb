FactoryBot.define do
  factory :group do
    admin { create(:user) }

    after :build do |group|
      group.users << group.admin
    end

    trait :with_users do
      after :build do |user|
        user.users << create_list(:user, 3)
      end
    end
  end
end