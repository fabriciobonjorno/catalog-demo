class ProductsController < ApplicationController
  include MenuResources
  before_action :set_resources, :only => %i[show]
  layout "home"

  def show
    @product = Product.friendly.find(params[:id])
  end
end
