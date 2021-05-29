# frozen_string_literal: true

class Manufacturer < ApplicationRecord
  # validates
  validates :description, presence: true
  validates :description, uniqueness: true
  strip_attributes

  # associations
  has_many :groups, dependent: :destroy
  has_many :families, through: :groups
end
