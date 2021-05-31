# frozen_string_literal: true

module MenuResources
  extend ActiveSupport::Concern

  def set_resources
    @products = Product.product_home.order(:code)
    @company = Company.first
    if Manufacturer.present?
      @manufacturers = Manufacturer.joins(groups: [families: [:products]]).distinct.order(:description)
    end
  end
end
