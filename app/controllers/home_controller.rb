class HomeController < ApplicationController
  layout "home"

  def index
    @products = Product.product_home.order(:code)
    @company = Company.first
  end

  def home
    @products = Product.order(:code)
    @company = Company.first
  end
end
