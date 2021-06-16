require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context "出品できる場合" do
      it 'name,price,prefecture_id,category,description,item_condition,shipping_cost,shipping_day,user_idが存在すれば登録できる' do
        expect(@item)
      end
    end

    context "保存できない場合" do
    it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
    end

      it 'nameが空では登録できないこと' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'priceが空では登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it 'priceが300円以下では登録できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it 'priceが全角数字は登録できない' do
        @item.price = "１１１１"
        @item.valid?
      end

      it 'prefectureが空では登録できないこと' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it 'categoryが空では登録できないこと' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it 'descriptionが空では登録できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it 'item_conditionが空では登録できないこと' do
        @item.item_condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it 'shipping_costが空では登録できないこと' do
        @item.shipping_cost = nil
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it 'shipping_dayが空では登録できないこと' do
        @item.shipping_day = nil
        @item.valid?
        expect(@item.errors.full_messages)
      end
    end
  end
end



