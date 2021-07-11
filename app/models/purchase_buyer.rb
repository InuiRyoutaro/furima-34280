class PurchaseBuyer
  include ActiveModel::Model
  attr_accessor :token
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase, :user_id, :item_id

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Buyer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, adress: adress, building_name: building_name, phone_number: phone_number, purchase: purchase,)
  end


end