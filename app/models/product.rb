# frozen_string_literal: true

class Product < ApplicationRecord
  attr_reader :group_id, :manufacturer_id

  has_one_attached :photo_product
  extend FriendlyId
  # validates
  validates :code, :ean, :dun, :description, presence: true
  validates :code, :ean, :dun, uniqueness: true
  validates :photo_product, presence: true, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..5.megabytes }

  # converted
  friendly_id :description, use: :slugged

  # associations
  has_many :similar_products, dependent: :destroy
  belongs_to :family
  belongs_to :tax_classification

  def active?
    active
  end

  def detach?
    detach
  end

  def group_id
    self&.family&.group_id
  end

  def manufacturer_id
    self&.family&.group&.manufacturer_id
  end

  scope :product_home, -> { where(detach: true).where(active: true) }

end
