FactoryBot.define do
  factory :item do
    name {"Monster"}
    price  {1000}
    description {"ナイキ"}
    prefecture_id {2}
    category_id {2}
    item_condition_id {2}
    shipping_cost_id {2}
    shipping_day_id {2}
    
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/adidas.jpeg'), filename: 'adidas.jpeg')
    end
  end
end
