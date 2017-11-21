FactoryBot.define do
  factory :post do
    sequence(:text) {|n| "post #{n}"}
    anon false
    deleted false
    user
    topic

  end
end
