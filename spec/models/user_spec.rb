require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    it "nick_nameが空では登録できないこと" do
      @user.nick_name = nil
      @user.valid?
    end
    
    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    
    it "first_nameが全角（漢字・ひらがな・カタカナ）であること" do
      @user.first_name = "122222"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    
    it "first_name_fが空では登録できないこと" do
      @user.first_name_f = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name f can't be blank")
    end
    
    it "first_name_fが全角（漢字・ひらがな・カタカナ）であること" do
      @user.first_name = "122222"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    
    it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    
    it "last_nameが全角（カタカナ）であること" do
      @user.last_name_f = "furigana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name f is invalid")
    end
    
    it "last_name_fが空では登録できないこと" do
      @user.last_name_f = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name f can't be blank")
    end
    
    it "last_name_fが全角（カタカナ）であること" do
      @user.last_name_f = "furigana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name f is invalid")
    end
    
    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "emailは@を含む必要があること" do
      @user.email = "aaaaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "重複したemailが登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    
    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it "passwordが6文字以上であれば登録できること" do
      @user.password = '111aaa'
      @user.valid?
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it "passwordは半角英数字混合での入力が必須であること" do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    
    it "passwordは半角英字のみでは登録できない" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    
    it "passwordは半角数字のみでは登録できない" do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordは全角ではでは登録できない" do
      @user.password = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it "birth_dayが空では登録できないこと" do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
end