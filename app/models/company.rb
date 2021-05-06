# frozen_string_literal: true

class Company < ApplicationRecord
  has_one_attached :photo_company

  validates :photo_company, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..5.megabytes }
end
