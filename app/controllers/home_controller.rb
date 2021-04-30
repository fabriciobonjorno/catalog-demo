class HomeController < ApplicationController
  layout 'home'
  def index
    @products = Product.order(:code)
  end

  def home
    @products = Product.order(:code)
  end
end
