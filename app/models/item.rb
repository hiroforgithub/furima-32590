class Item < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :category, presence: true
  validates :prefecture, presence: true
  validates :shipping_date, presence: true
  validates :shipping_fee, presence: true
  validates :status, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :shipping_fee
  belongs_to :status
  belongs_to :user
  has_one_attached :image
  has_one :buy

end
