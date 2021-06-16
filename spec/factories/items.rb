FactoryBot.define do
  factory :item do
    name {"Monster"}
    price  {"1000"}
    description {"ナイキ"}
    prefecture_id {"1"}
    category_id {"1"}
    item_condition_id {"2"}
    shipping_cost_id {"2"}
    shipping_day_id {"2"}
    user_id           {"1"}
  end
end
