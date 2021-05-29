# frozen_string_literal: true

class Family < ApplicationRecord
  attr_reader :manufacturer_id

  # validates
  validates :description, presence: true
  validates :description, uniqueness: true
  strip_attributes

  # associations
  has_many :products, dependent: :destroy
  belongs_to :group

  # Methods public
  def manufacturer_id
    self&.group&.manufacturer_id
  end
end
