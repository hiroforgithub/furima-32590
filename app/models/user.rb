class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :first_name, presence: true
  validates :first_name_f, presence: true
  validates :last_name, presence: true
  validates :last_name_f, presence: true
  validates :birth_day, presence: true
end
