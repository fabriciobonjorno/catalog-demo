# frozen_string_literal: true

class Company < ApplicationRecord
  # associations
  has_one_attached :photo_company

  has_many :extra_informations
  accepts_nested_attributes_for :extra_informations

  has_many :contacts, inverse_of: :company
  accepts_nested_attributes_for :contacts, allow_destroy: true, reject_if: :all_blank

  validates :photo_company, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..5.megabytes }

  def commercial?
    Contact.where(commercial: true).sample
  end

  def financial?
    Contact.where(financial: true).sample
  end

  def logistic?
    Contact.where(logistic: true).sample
  end

  def administrative?
    Contact.where(administrative: true).sample
  end
end
