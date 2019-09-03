class Order < ApplicationRecord
  attr_accessor :order_items_attributes
  has_many :order_items
  accepts_nested_attributes_for :order_items
end
