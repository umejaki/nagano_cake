class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :cart_items
  has_many :order_products
  
  enum payment_method: { credit_card: 0, transfer: 1 }
end
