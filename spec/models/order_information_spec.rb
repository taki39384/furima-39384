require 'rails_helper'

RSpec.describe OrderInformation, type: :model do
  describe '商品購入記録の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_information = FactoryBot.build(:order_information,user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_information).to be_valid
      end
      it '建物名が空でも購入できること' do
        @order_information.building_name = nil
        expect(@order_information).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号は空では保存できないこと' do
        @order_information.post_code = ''
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
        @order_information.post_code = '123-123４'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県に「---」が選択されている場合は購入できないこと' do
        @order_information.region_of_origin_id = '1'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Region of origin can't be blank")
      end
      it '市区町村が空だと購入できないこと' do
        @order_information.municipalities = ''
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空だと購入できないこと' do
        @order_information.address = ''
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できないこと' do
        @order_information.number = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Number can't be blank")
      end
      it '電話番号が9桁以下だと購入できないこと' do
        @order_information.number = '090123456'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Number is invalid")
      end
      it '電話番号が12桁以上だと購入できない' do
        @order_information.number = '090123456789'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Number is invalid")
      end
      it '電話番号が半角数値でないと購入できないこと' do
        @order_information.number = '０9012341234'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Number is invalid")
      end
      it 'user_idが紐づいていなければ購入できないこと' do
        @order_information.user_id = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenが空では購入できないこと' do
        @order_information.token = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Token can't be blank")
      end
      it 'item_idが紐づいていなければ購入できないこと' do
        @order_information.item_id = ''
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
