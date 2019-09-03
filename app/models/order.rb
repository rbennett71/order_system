class Order < ApplicationRecord
  attr_accessor :order_items_attributes
  has_many :order_items
  accepts_nested_attributes_for :order_items
end

def save
end

class << self
  def self.new params
    super

    warn "params = #{params.inspect}"
  end
end