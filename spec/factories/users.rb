FactoryBot.define do
  factory :user do
    nickname {"Monster"}
    email {"test@gmail.com"}
    password {"123456"}
    password_confirmation {"123456"}
    family_name {"山田"}
    family_name_japanese {"ヤマダ"}
    first_name {"太朗"}
    first_name_japanese {"タロウ"}
    birth_day {"1995-06-01"}
  end
end


