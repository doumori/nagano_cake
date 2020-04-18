class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


    has_many :order, dependent: :destroy
    has_many :order_item, dependent: :destroy
    has_many :item, dependent: :destroy
    has_many :ship, dependent: :destroy

end
