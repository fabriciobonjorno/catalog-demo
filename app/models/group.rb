# frozen_string_literal: true

class Group < ApplicationRecord
  extend FriendlyId
  # validates
  validates :description, presence: true
  validates :description, uniqueness: true

  # converted
  friendly_id :description, use: :slugged

  # associations
  belongs_to :manufacturer
  has_many :families, dependent: :destroy
  has_many :products, through: :families
end
