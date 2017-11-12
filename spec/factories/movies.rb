FactoryGirl.define do
  factory :movie do
    sequence(:title) {|n| "Movie ##{n}" }
    text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    association :category, factory: :category
    association :user, factory: :user
  end
end