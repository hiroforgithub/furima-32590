require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

    it "prefecture_idが空では登録できないこと" do
      @address.code = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("")
    end
    
    it "cityが空では登録できないこと" do
      @address.city = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("")
    end
    
    it "streetが空では登録できないこと" do
      @address.street = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("")
    end
    
    it "buildingが空では登録できないこと" do
      @address.building = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("")
    end
    
    it "telが空では登録できないこと" do
      @address.tel = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("")
    end
    
  end
  