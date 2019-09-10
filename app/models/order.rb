class Order < ApplicationRecord
  has_many :order_items
  validates :customer_name, presence: true

end
