class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :code, :prefecture_id, :city, :street, :building, :tel, :token

  with_options presence: true do
    validates :code, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/}
    validates :prefecture_id
    validates :city
    validates :street
    validates :tel, length: { maximum: 11}, format: { with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    # 購入の情報を保存
    buy = Buy.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create(code: code, prefecture_id: prefecture_id, city: city, street: street, building: building, tel: tel, buy_id: buy.id)
  end


end