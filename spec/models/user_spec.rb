require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.buid(:user)
  end

    it "nick_nameが空では登録できないこと" do
      # @user.nick_name = nill
      # @user.valid?
      # expect(@user.errors.full_messages).to include("Name can't be blank")
      # binding.pry
    end
    
    it "first_nameが空では登録できないこと" do
    end

    it "first_nameが全角（漢字・ひらがな・カタカナ）であること" do
    end
    
    it "first_name_fが空では登録できないこと" do
    end
    
    it "first_name_fが全角（漢字・ひらがな・カタカナ）であること" do
    end
    
    it "last_nameが空では登録できないこと" do
    end

    it "last_nameが全角（カタカナ）であること" do
    end
    
    it "last_name_fが空では登録できないこと" do
    end

    it "last_name_fが全角（カタカナ）であること" do
    end

    it "emailが空では登録できないこと" do
    end

    it "emailは@を含む必要があること" do
    end
    
    it "passwordが空では登録できないこと" do
    end
    
    it "passwordが6文字以上であれば登録できること" do
    end
    
    it "passwordが5文字以下であれば登録できないこと" do
    end

    it "passwordは半角英数字混合での入力が必須であること" do
    end
    
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
    end
    
    it "birth_dayが空では登録できないこと" do
    end


end
