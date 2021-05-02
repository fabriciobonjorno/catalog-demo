module MenuResources
  extend ActiveSupport::Concern

  private

  def set_resources
    @products = Product.product_home.order(:code)
    @company = Company.first
    @manufacturers = Manufacturer.order(:description)
  end
end
