FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user.#{n}@riskmethods.net" }
    password "1234qwer"
    password_confirmation "1234qwer"
  end
end