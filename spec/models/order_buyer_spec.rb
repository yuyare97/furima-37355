require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_buyer = FactoryBot.build(:order_buyer, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe 'OrderBuyer登録' do
    context '登録がうまくいくとき' do
      it 'token, postcode, prefecture_id, city, address, phone_number,が存在すれば登録できる' do
        expect(@order_buyer).to be_valid
      end
      it 'apartment_nameが空でも登録できる' do
        @order_buyer.apartment_name = nil
        expect(@order_buyer).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it 'postcodeが空だと登録できない' do
        @order_buyer.postcode = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが-がないと登録できない' do
        @order_buyer.postcode = '1234567'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'prefecture_idが「−−−」だと登録できない' do
        @order_buyer.prefecture_id = '0'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと登録できない' do
        @order_buyer.city = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include()
      end
      it 'addressが空だと登録できない' do
        @order_buyer.address = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include()
      end
      it 'phone_numberが空だと登録できない' do
        @order_buyer.phone_number = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では登録できない' do
        @order_buyer.phone_number = '000111222'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上では登録できない' do
        @order_buyer.phone_number = '000111222333'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_buyer.phone_number = '00011122233３'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'userが紐付いていなければ購入できない' do
        @order_buyer.user_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include()
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_buyer.item_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include()
      end
      it 'tokenが空では購入できない' do
        @order_buyer.token = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include()
      end
    end
  end
end
