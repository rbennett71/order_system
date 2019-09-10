class OrderItem < ApplicationRecord
  attr_accessor :sku

  belongs_to :order
  belongs_to :product
  before_save :compile_allocation_note

  def initialize params
    super

    self.product = Product.find_by_sku(params['sku'])
  end

  def compile_allocation_note
    notes = []
    product.percentages.each do |allocation|
      next if allocation.percentage.zero?

      notes << "#{allocation.vendor.name} is assigned #{((allocation.percentage.to_f * self.count)/100).round} based on (#{allocation.percentage}%)"
    end
    self.allocation_note = notes.join('|')
  end
end
