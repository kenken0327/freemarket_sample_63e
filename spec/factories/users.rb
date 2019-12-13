FactoryBot.define do

  factory :user do
    sequence(:nickname) {Faker::Name.name}
    sequence(:email) {Faker::Internet.email}
    sequence(:password)     {Faker::Internet.password}
    last_name              {"伊藤"}
    first_name             {"航太"}
    last_kana             {"イトウ"}
    first_kana            {"コウタ"}
    year_id               {"1"}
    month_id              {"1"}
    date_id               {"1"}
    tell_no               {"090-3333-4444"}
  end
end