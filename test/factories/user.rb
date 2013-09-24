FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name 'Doe'
    email 'john@testing.tld'
    password 'testingthis'
    password_confirmation 'testingthis'
  end
end
