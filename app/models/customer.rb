class Customer < ApplicationRecord
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         devise :validatable, password_length: 8..20
  
  has_many :cart_items
  has_many :orders
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
end
