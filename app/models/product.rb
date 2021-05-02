# frozen_string_literal: true

class Product < ApplicationRecord
  attr_reader :group_id, :manufacturer_id

  has_one_attached :photo_product
  extend FriendlyId
  # validates
  validates :code, :ean, :dun, :description, presence: true
  validates :code, :ean, :dun, uniqueness: true
  validate :image_validation

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

  private

  def image_validation
    if respond_to?(:image) && image.attached?
      if image.blob.byte_size > 2_000_000
        image.purge
        errors[:base] << 'Tamanho maximo 2MB'
      elsif !image.blob.content_type.starts_with?('image/png', 'image/jpeg', 'image/jpg')
        image.purge
        errors[:base] << 'Formato invalido use PNG, JPEG, JPG'
      end
    end
  end
end
