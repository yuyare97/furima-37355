require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  before do
    @order_buyer = FactoryBot.build(:order_buyer)
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
      it 'phone_numberが10桁か11桁でないと登録できない' do
        @order_buyer.phone_number = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
