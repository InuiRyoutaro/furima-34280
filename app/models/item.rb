class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions  
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition 
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_day

  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates_inclusion_of :price, in: 300..999999
  end

  validates :price, format: { with: /\A[0-9]+\z/ }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_day_id
  end
  
end
