FactoryBot.define do
  factory :topic276, class: Topic do
    description "studygroup"
    title "Cmpt276 exam"
    first_post "Testing123?"
    user
    cmpt276
  end
end

FactoryBot.define do
  factory :topic do
    description "general"
    title "Cmpt 276 exam"
    first_post "Did anyone find that test unfair?"
    user
    course
  end
end
