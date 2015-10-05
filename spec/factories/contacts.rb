FactoryGirl.define do

  factory :contact do
    firstname "Maria"
    lastname "Doe"
    sequence(:email) { |n| "mariadoe#{n}@example.com" }
  end

end
