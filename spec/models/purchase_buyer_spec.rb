require 'rails_helper'

RSpec.describe PurchaseBuyer, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @purchase_buyer = FactoryBot.build(:purchase_buyer, user_id: @user.id , item_id: @item.id)
  end

  describe '商品購入機能' do

    context "購入できる場合" do
      it 'post_code,prefecture_id,city,adress,building_name,phone_number,user_id,item_id,tokenが存在すれば登録できる' do
        expect(@purchase_buyer)
      end

      it 'building_nameが空でも購入できる'do
      @purchase_buyer.building_name = ""
      expect(@purchase_buyer)
      end

    end

    context "購入できない場合" do
      it 'prefecture_idが空では購入できないこと' do
        @purchase_buyer.prefecture_id = ""
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では購入できないこと' do
        @purchase_buyer.city = ""
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では購入できないこと' do
        @purchase_buyer.address = ""
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では購入できないこと' do
        @purchase_buyer.phone_number = ""
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上では購入できないこと' do
        @purchase_buyer.phone_number = "090123456789"
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが英数混合では購入できないこと' do
        @purchase_buyer.phone_number = "0901234gt56"
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone number is invalid")
      end

      it 'post_codeが空では購入できないこと' do
        @purchase_buyer.post_code = ""
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeは3桁の数字とハイフンと４桁の数字でなければ購入できないこと' do
        @purchase_buyer.post_code = "1231234"
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'user_idが空では購入できないこと' do
        @purchase_buyer.user_id = ""
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できないこと' do
        @purchase_buyer.item_id = ""
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では購入できないこと' do
        @purchase_buyer.token = ""
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end



