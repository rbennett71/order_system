class Vendor < ApplicationRecord
  has_many :percentages
  has_many :products, through: :percentages
  accepts_nested_attributes_for :percentages, allow_destroy: :true, update_only: true
end
