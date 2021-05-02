class HomeController < ApplicationController
  include MenuResources
  before_action :set_resources, :only => %i[index]
  layout "home"

  def index
  end

  def home
    @products = Product.order(:code)
    @company = Company.first
  end
end
