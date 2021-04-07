class Product < ApplicationRecord
  # validates
  validates :code, :ean, :dun, :description, presence: true
  validates :code, :ean, :dun, uniqueness: true

  # associations
  has_many :similar_products, dependent: :destroy
  belongs_to :family
  belongs_to :tax_classification
end
