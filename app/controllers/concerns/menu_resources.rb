# frozen_string_literal: true

module MenuResources
  extend ActiveSupport::Concern

  def set_resources
    @products = Product.product_home.order(:code)
    @company = Company.first
    @manufacturers = Manufacturer.joins(groups: [families: [:products]]).order(:description)
  end
end
