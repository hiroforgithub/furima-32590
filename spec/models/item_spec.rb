require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

    it "titleが空では登録できないこと" do
      @item.title = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it "textが空では登録できないこと" do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "category_idが空では登録できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "prefecture_idが空では登録できないこと" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "shipping_date_idが空では登録できないこと" do
      @item.shipping_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank")
    end
    it "shipping_fee_idが空では登録できないこと" do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end
    it "status_idが空では登録できないこと" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
  
end
