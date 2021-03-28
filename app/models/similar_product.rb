class SimilarProduct < ApplicationRecord
  # validates
  validates :code, :ean, :dun, :description, presence: true
  validates :code, :ean, :dun, uniqueness: true

  # associations
  belongs_to :product
end
