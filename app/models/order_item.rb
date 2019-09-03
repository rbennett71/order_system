class OrderItem < ApplicationRecord
  attr_accessor :sku

  belongs_to :order
  belongs_to :product

  def initialize params
    super
    self.product = Product.find_by_sku(params['sku'])
    self.allocation_note = compile_allocation_note
  end

  def compile_allocation_note
    notes = []
    self.product.percentages.each do |allocation|
      next if allocation.percentage == 0
      notes << "#{allocation.vendor.name} is assigned #{((allocation.percentage.to_f * self.count)/100).round} based on (#{allocation.percentage}%)"
    end
    notes.join("|")
  end
end
