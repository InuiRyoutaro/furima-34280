class PurchaseBuyers
  include ActiveModel::Model
  attr_accessor :post_code :prefecture_id, :city, :address, :building_name, :phone_number, :purchase, :user_id, :item_id

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
    validates :purchase
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  def save
    # 寄付情報を保存し、変数donationに代入する
    # 購入情報を保存し、変数purchaseに代入する
    # donation = Donation.create(price: price, user_id: user_id)
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    # Address.create(postal_code: postal_code, prefecture: prefecture, city: city, adress: , building_name: building_name, donation_id: donation.id)
    Buyers.create(post_code: post_code, prefecture_id: prefecture_id, city: city, adress: adress, building_name: building_name, phone_number: phone_number, purchase: purchase,)
  end


end