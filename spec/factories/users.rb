FactoryBot.define do
  factory :user do
    nick_name {"山田太郎"}
    first_name {"太郎"}
    first_name_f {"タロウ"}
    last_name {"山田"}
    last_name_f {"ヤマダ"}
    email {Faker::Internet.free_email}
    password = "111aaa"
    password {password}
    password_confirmation {password}
    birth_day {20110101}
  end
end