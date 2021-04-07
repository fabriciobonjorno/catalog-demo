class Group < ApplicationRecord
  # validates
  validates :description, presence: true
  validates :description, uniqueness: true

  # associations
  belongs_to :manufacturer
  has_many :families, dependent: :destroy
  has_many :products, through: :families
end
