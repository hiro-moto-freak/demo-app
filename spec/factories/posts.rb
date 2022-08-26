FactoryBot.define do
  factory :post do
    title {Faker::Types.rb_string}
    text {Faker::Lorem.sentence}
    association :user
  end
end
