require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context "保存できる場合" do
      it 'nickname,email,password,password_confirmation,family_name,first_name,family_name_japanese,first_name_japanese,birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context "保存できない場合" do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it 'emailが空では登録できないこと' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it 'passwordが空では登録できないこと' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it 'family_nameが空では登録できないこと' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
  
      it 'first_nameが空では登録できないこと' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
  
      it 'family_name_japaneseがカナ入力が空では登録できないこと' do
        @user.family_name_japanese = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name japanese can't be blank")   
      end
  
      it 'first_name_japaneseがカナ入力が空では登録できないこと' do
        @user.first_name_japanese = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name japanese can't be blank")   
      end
  
      it '生年月日が空では登録できないこと' do
        @user.birth_day = ""
        @user.valid?
      end

      it 'passwordが半角英語のみは登録できない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが数字のみは登録できない' do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが全角英数混合は登録できない' do
        @user.password = "AAA111"
        @user.valid?
      end

      it '姓：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
        @user.family_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid"
      end

      it '名：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
        @user.first_name = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it '姓（フリガナ）：全角（カタカナ）以外は登録できない' do
        @user.family_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it '名（フリガナ）：全角（カタカナ）以外は登録できない' do
        @user.first_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.valid?
        expect(another_user.errors.full_messages).to include()
      end

      it 'passwordが存在してもpassword_confirmationが存在していなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが6文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'hogehuga.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

    end
  
  end
end 