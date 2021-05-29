class Subscriber < ApplicationRecord
  # validates
  validates :email, presence: true, format: { with: /((\w+\s?-?\w+)(,|\z))/i}
  validates :email, uniqueness: true
  strip_attributes only: %i[email name]
end