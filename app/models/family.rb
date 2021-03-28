class Family < ApplicationRecord
  # validates
  validates :description, presence: true
  validates :description, uniqueness: true

  # associations
  has_many :products, dependent: :destroy
  belongs_to :group
end
