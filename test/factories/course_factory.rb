FactoryBot.define do

  factory :course do
    sequence(:name) { |n| "MATH #{n}" }
    term "spring"
  end

  factory :cmpt276, class: Course do
    name "CMPT 276"
    term "fall"
  end
end
