FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
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