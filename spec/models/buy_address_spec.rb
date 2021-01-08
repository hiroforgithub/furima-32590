require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @buy_address = FactoryBot.build(:buy_address)
  end
  
    it "正しく入力されたとき登録ができること" do
      expect(@buy_address).to be_valid
    end

    it "user_idが空では登録できないこと" do
      @buy_address.user_id = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空では登録できないこと" do
      @buy_address.item_id = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Item can't be blank")
    end

    it "codeが空では登録できないこと" do
      @buy_address.code = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Code can't be blank")
    end

    it "codeにはハイフンが必要であること" do
      @buy_address.code = 1234567
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Code is invalid")
    end
    
    it "prefecture_idが空では登録できないこと" do
      @buy_address.prefecture_id = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "cityが空では登録できないこと" do
      @buy_address.city = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("City can't be blank")
    end

    it "streetが空では登録できないこと" do
      @buy_address.street = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Street can't be blank")
    end

    it "telが空では登録できないこと" do
      @buy_address.tel = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Tel can't be blank")
    end

    it "telにはハイフンが必要でないこと" do
      @buy_address.tel = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Tel is invalid")
    end

    it "telは11桁以内であること" do
      @buy_address.tel = 123456789123
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
    end

    it "telは英数混合では登録できないこと" do
      @buy_address.tel = "1234567891aa"
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Tel is invalid")
    end

    it "tokenが空では登録できないこと" do
      @buy_address.token = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Token can't be blank")
    end
    
end
