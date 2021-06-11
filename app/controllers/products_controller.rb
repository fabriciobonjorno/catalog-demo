# frozen_string_literal: true

class ProductsController < HomeController
  include MenuResources
  before_action :set_resources, only: %i[show]
  layout 'home'

  def show
    @product = Product.friendly.find(params[:id])
    @subscriber = Subscriber.new
  end
end
