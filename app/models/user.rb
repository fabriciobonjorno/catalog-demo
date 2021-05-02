class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable
  has_one_attached :photo_profile
  validate :image_validation

  def admin?
    profile
  end

  private

  def image_validation
    if respond_to?(:image) && image.attached?
      if image.blob.byte_size > 2_000_000
        image.purge
        errors[:base] << "Tamanho maximo 2MB"
      elsif !image.blob.content_type.starts_with?("image/png", "image/jpeg", "image/jpg")
        image.purge
        errors[:base] << "Formato invalido use PNG, JPEG, JPG"
      end
    end
  end
end
