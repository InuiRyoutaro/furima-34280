FactoryBot.define do
  factory :user do
    nickname {"Monster"}
    email {Faker::Internet.free_email}
    password {"1aa456"}
    password_confirmation {"1aa456"}
    family_name {"山田"}
    family_name_japanese {"ヤマダ"}
    first_name {"太朗"}
    first_name_japanese {"タロウ"}
    birth_day {"1995-06-01"}
  end
end


