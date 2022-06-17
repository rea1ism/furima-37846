require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        another_user = FactoryBot.build(:user)
        another_user.save
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは半角英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは半角数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは全角文字を含むと登録できない' do
        @user.password = 'あいうえお'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc1234567'
        @user.password_confirmation = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)は、名字だけでは登録できない' do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
      end
      it 'お名前(全角)は、名前だけでは登録できない' do
        @user.familyname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname kanji can't be blank")
      end
      it 'お名前(全角)の名字は、半角では登録できない' do
        @user.familyname_kanji = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname kanji is invalid")
      end
      it 'お名前(全角)の名前は、半角では登録できない' do
        @user.firstname_kanji = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji is invalid")
      end
      it 'お名前カナ(全角)は、名字だけでは登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it 'お名前カナ(全角)は、名前だけでは登録できない' do
        @user.familyname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname kana can't be blank")
      end
      it 'お名前カナ(全角)の名字は、半角では登録できない' do
        @user.familyname_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname kana is invalid")
      end
      it 'お名前カナ(全角)の名前は、半角では登録できない' do
        @user.firstname_kana = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid")
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
