# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable
  has_one_attached :photo_profile
  validates :photo_profile, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..5.megabytes }

  # Methods public
  def admin?
    profile
  end

  def self.support
    User.where.not(email: 'suporte@meucatalogo.art.br')
  end
end
