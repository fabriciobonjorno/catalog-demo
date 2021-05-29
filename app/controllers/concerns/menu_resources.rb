# frozen_string_literal: true

module MenuResources
  extend ActiveSupport::Concern

  def set_resources
    @products = Product.product_home.order(:code)
    @company = Company.first
    @manufacturers = Manufacturer.order(:description)
  end
end
