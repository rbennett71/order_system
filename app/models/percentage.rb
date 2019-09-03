class Percentage < ApplicationRecord
  belongs_to :product, inverse_of: :percentages
  belongs_to :vendor, inverse_of: :percentages
  validates_uniqueness_of :product, scope: :vendor


  def save options
    self.percentage = 0 unless self.percentage
    super
  end

end
