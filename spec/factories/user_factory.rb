FactoryGirl.define do
  factory :user do
    first_name "Walter"
    last_name "White"
    sequence(:username) { |n| "heisenberg#{n}" }
    password_digest "encrypted"
    email "heisenberg#{Random.rand(10000)}@gmail.com"
    authentication_token "a_token"
  end
end
