class Product < ApplicationRecord
  has_many :order_items
  has_many :percentages, inverse_of: :product
  has_many :vendors, through: :percentages
  accepts_nested_attributes_for :percentages, allow_destroy: true

  validates :sku,uniqueness: true, presence: true
  validate :percentages_total

  private

  def percentages_total
    total = self.percentages.sum{|p| p.percentage || 0}

    if total != 100
      errors.add(:percentages, "Pecentages must total 100")
      return false
    else
      return true
    end
  end
end
