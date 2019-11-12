FactoryBot.define do
  factory :user do
    transient do
      sequence :n
    end

    email { "user#{n}@isp.com" }

    first_name { 'John' }
    last_name  { 'Doe' }

    after :build do |user|
      user.password ||= 'goodPassword123'
      user.password_confirmation ||= 'goodPassword123'

      user.department = build(:department)
    end

    trait :with_active_group do
      after :build do |user|
        # Inactive
        user.groups << create_list(:group, 3)
        # Active
        user.groups << create(:group, active: true)
      end
    end

    trait :with_active_questionnaire do
      after :build do |user|
        # Inactive
        user.questionnaires << create_list(:questionnaire, 3, active: false)
        # Active
        user.groups << create(:questionnaire)
      end
    end
  end
end