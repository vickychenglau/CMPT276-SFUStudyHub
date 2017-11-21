FactoryBot.define do

  factory :course do
    sequence(:name) { |n| "MATH #{n}" }
    term "Spring 2020"
  end

  factory :cmpt276, class: Course do
    name "CMPT 276"
    term "Fall 2017"
  end
end
