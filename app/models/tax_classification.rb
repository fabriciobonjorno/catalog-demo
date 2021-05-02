class TaxClassification < ApplicationRecord
  # validates
  validates :description, :presence => true
  validates :description, :uniqueness => true

  # associations
  has_many :products
end
