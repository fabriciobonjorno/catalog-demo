class HomeController < ApplicationController
  layout 'home'
  def index
    render file: 'public/index.html'
  end

  def home
    @products = Product.order(:code)
  end
end
