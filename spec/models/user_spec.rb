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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        another_user = FactoryBot.build(:user)
        another_user.save
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordは半角英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordは半角数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordは全角文字を含むと登録できない' do
        @user.password = 'あいうえお'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc1234567'
        @user.password_confirmation = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'お名前(全角)は、名字だけでは登録できない' do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前/名前（全角）を入力してください")
      end
      it 'お名前(全角)は、名前だけでは登録できない' do
        @user.familyname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前/名字（全角）を入力してください")
      end
      it 'お名前(全角)の名字は、半角では登録できない' do
        @user.familyname_kanji = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前/名字（全角）は不正な値です")
      end
      it 'お名前(全角)の名前は、半角では登録できない' do
        @user.firstname_kanji = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前/名前（全角）は不正な値です")
      end
      it 'お名前カナ(全角)は、名字だけでは登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ/名前（全角）を入力してください")
      end
      it 'お名前カナ(全角)は、名前だけでは登録できない' do
        @user.familyname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ/名字（全角）を入力してください")
      end
      it 'お名前カナ(全角)の名字は、半角では登録できない' do
        @user.familyname_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ/名字（全角）は不正な値です")
      end
      it 'お名前カナ(全角)の名前は、半角では登録できない' do
        @user.firstname_kana = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ/名前（全角）は不正な値です")
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
