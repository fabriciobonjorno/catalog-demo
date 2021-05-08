# frozen_string_literal: true

class Company < ApplicationRecord

  # associations
  has_one_attached :photo_company

  has_many :extra_informations
  accepts_nested_attributes_for :extra_informations

  has_many :contacts
  accepts_nested_attributes_for :contacts, reject_if: :all_blank, allow_destroy: true
  validates :photo_company, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..5.megabytes }
end
