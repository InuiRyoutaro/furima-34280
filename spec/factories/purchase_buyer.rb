FactoryBot.define do
  factory :purchase_buyer do
    post_code {"123-1234"}
    prefecture_id {1}
    city {"港区"}
    address {"新橋"}
    building_name {"SKTビル"}
    phone_number{"09012345678"}
    user_id {1}
    item_id {2}
    token {"tok_abcdefghijk00000000000000000"}
    
    association :purchase

  end
end