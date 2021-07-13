FactoryBot.define do
  factory :purchase_buyer do
    post_code {"123-1234"}
    prefecture_id {1}
    city {"港区"}
    address {"新橋"}
    building_name {"KFCビルディング"}
    phone_number{"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
    
    association :purchase
  end
end