# frozen_string_literal: true

class Company < ApplicationRecord
  # validates
  validates :photo_company, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..5.megabytes }
  strip_attributes

  # associations
  has_one_attached :photo_company

  has_many :extra_informations
  accepts_nested_attributes_for :extra_informations

  has_many :contacts
  accepts_nested_attributes_for :contacts, allow_destroy: true, reject_if: :all_blank?

  # Methods public
   def commercial_contact
    Contact.where(commercial: true).order('random()').first
  end

  def financial_contact
    Contact.where(financial: true).order('random()').first
  end

  def logistic_contact
    Contact.where(logistic: true).order('random()').first
  end

  def administrative_contact
    Contact.where(administrative: true).order('random()').first
  end

  def contact_home
    Contact.where.not(phone: nil)
  end
end
