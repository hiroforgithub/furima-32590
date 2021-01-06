class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :code, :prefecture_id, :city, :street, :building, :tel, :buy_id

  with_options presence: true do
    validates :code
    validates :prefecture_id
    validates :city
    validates :street
    validates :building
    validates :tel
    validates :user_id
    validates :item_id
  end

  def save
    # 購入の情報を保存
    buy =  Buy.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create(code: code, prefecture_id: prefecture_id, city: city, street: street, building: building, tel: tel, buy_id: buy.id)
  end


end