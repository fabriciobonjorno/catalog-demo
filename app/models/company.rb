# frozen_string_literal: true

class Company < ApplicationRecord
  # associations
  has_one_attached :photo_company

  has_many :extra_informations
  accepts_nested_attributes_for :extra_informations

  has_many :contacts
  accepts_nested_attributes_for :contacts, allow_destroy: true, reject_if: :all_blank

  validates :photo_company, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..5.megabytes }

  def random_commercial_contact
    Contact.where(commercial: true).order('random()').first
  end

  def random_financial_contact
    Contact.where(financial: true).order('random()').first
  end

  def random_logistic_contact
    Contact.where(logistic: true).order('random()').first
  end

  def random_administrative_contact
    Contact.where(administrative: true).order('random()').first
  end
end
