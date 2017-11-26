

FactoryBot.define do

  factory :user do
    sequence(:username) { |n| "User#{n}" }
    password "Password1"
    last_name "Foobart"

    first_name "Bart"
    email { "#{username}@gmilk.com".downcase}
    role "user"
    tutor false
  end

  factory :admin, class: User do
    sequence(:username) { |n| "Admin#{n}"}
    password "Password1aa"
    last_name "FootBall"
    first_name "Woos"
    email { "#{username}@gmilk.com".downcase}
    role "admin"
    tutor true
  end
end
