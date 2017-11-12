FactoryGirl.define do
  factory :rating do
    rate (1..5).to_a.sample
    association :movie, factory: :movie
    association :user, factory: :user
  end
end