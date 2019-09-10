class Percentage < ApplicationRecord
  belongs_to :product, inverse_of: :percentages
  belongs_to :vendor, inverse_of: :percentages
  validates_uniqueness_of :product, scope: :vendor
  before_save :initialize_percentage

  def initialize_percentage
    self.percentage = 0 unless self.percentage
  end

end
