

FactoryBot.define do

  factory :course do
    sequence(:name) { |n| "MATH #{n}" }
  end

  factory :cmpt276, class: Course do
    name "CMPT 276"
  end
end
