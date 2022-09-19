require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  describe '購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_destination = FactoryBot.build(:purchase_destination, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての情報が入力されていれば購入できること' do
        expect(@purchase_destination).to be_valid
      end
      it '建物名が空でも購入できること' do
        @purchase_destination.building = ''
        expect(@purchase_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
        @purchase_destination.post_code = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にハイフンが含まれていないと保存できない' do
        @purchase_destination.post_code = '1234567'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("郵便番号が不正です。ハイフンを入力してください")
      end
      it '都道府県が選択されていないと保存できない' do
        @purchase_destination.prefecture_id = 1
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("都道府県を選択してください")
      end
      it '市町村区が空だと保存できない' do
        @purchase_destination.city = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("市町村区を入力してください")
      end
      it '番地が空だと保存できない' do
        @purchase_destination.street_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空だと保存できない' do
        @purchase_destination.phone_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号にハイフンが含まれていると保存できない' do
        @purchase_destination.phone_number = '090-1234-5678'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("電話番号は数値で入力してください")
      end
      it '電話番号が9桁だと保存できない' do
        @purchase_destination.phone_number = '031234567'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("電話番号は10文字以上で入力してください")
      end
      it '電話番号が12桁だと保存できない' do
        @purchase_destination.phone_number = '090123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("電話番号は11文字以内で入力してください")
      end
      it 'tokenが空だと保存できない' do
        @purchase_destination.token = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'userが紐づいていなければ保存できない' do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐づいていなければ保存できない' do
        @purchase_destination.item_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
