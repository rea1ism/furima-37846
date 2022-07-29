require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  describe '購入' do
    before do
      @purchase_destination = FactoryBot.build(:purchase_destination)
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
        expect(@purchase_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンが含まれていないと保存できない' do
        @purchase_destination.post_code = '1234567'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が選択されていないと保存できない' do
        @purchase_destination.prefecture_id = 1
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村区が空だと保存できない' do
        @purchase_destination.city = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @purchase_destination.street_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Street number can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @purchase_destination.phone_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンが含まれていると保存できない' do
        @purchase_destination.phone_number = '090-1234-5678'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空だと保存できない' do
        @purchase_destination.token = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
