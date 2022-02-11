require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品ができるとき' do
      it ':image,:name,:describe,:price,:category_id,f:status_id,delv_fee_id,:ship_from_id,:delv_days_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it ':priceが半角数字でかつ300〜9999999の間の金額であるとき' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it ':imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it ':nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it ':descriptionが空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it ':priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it ':priceが半角数字以外だと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it ':priceが300~9999999の範囲外だと登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it ':category_idが「---」だと登録できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it ':condition_idが「---」だと登録できない' do
        @item.condition_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it ':burden_idが「---」だと登録できない' do
        @item.burden_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it ':prefecture_idが「---」だと登録できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it ':scheduled_day_idが「---」だと登録できない' do
        @item.scheduled_day_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled day can't be blank")
      end
    end
  end
end