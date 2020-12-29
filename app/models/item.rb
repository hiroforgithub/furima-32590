class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/ }, inclusion: {in: 300..9999999 } 
    validates :image
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :status
  belongs_to :user
  has_one_attached :image
  has_one :buy
  
  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 0 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :shipping_date_id
      validates :shipping_fee_id
      validates :status_id
    end
  end
end
  