class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :orders, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    has_many :ships, dependent: :destroy

  def active_for_authentication?
    super && (self.is_member_status == false)
  end
end
