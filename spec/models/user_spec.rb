require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    
    it 'nicknameが空では登録できないこと' do
      @user = User.new(nickname: "")
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user = User.new(email: "")
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できないこと' do
      @user = User.new(password: "")
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'family_nameが空では登録できないこと' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
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
      @user.birth_day = nil
      @user.valid?
      #expect(@user.errors_full_messages).to include("Birth_day can't be blank")
    end
  end
end 