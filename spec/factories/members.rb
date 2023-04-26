FactoryBot.define do
  factory :member do
    sequence(:first_name) { |n| "Member#{n}" }
    sequence(:last_name) { |n| "Member#{n}" }
    city { "Dallas" }
    state { "Texas" }
    country { "USA" }

    team
  end
end
