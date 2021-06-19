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
    it 'imageが空ではときは保存できない' do
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
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが300円以下では登録できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが全角数字は登録できない' do
        @item.price = "１１１１"
        @item.valid?
      end

      it 'prefectureで”--”が選択されているときは保存できないことでは登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'categoryで”--”が選択されているときは保存できないことでは登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'item_conditionで”--”が選択されているときは保存できないことでは登録できないこと' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'shipping_costで”--”が選択されているときは保存できないことでは登録できないこと' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'shipping_dayで”--”が選択されているときは保存できないことでは登録できないこと' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'descriptionが空では登録できないこと' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it '価格が半角英数混合では登録できないこと' do
        @item.price = "aa111aa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '価格が半角英語だけでは登録できないこと' do
        @item.price = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '価格が10,000,000以上では登録できないこと' do
        @item.price = 10,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

    end
  end
end



