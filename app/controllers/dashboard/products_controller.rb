module Dashboard
  class ProductsController < DashboardController
    before_action :set_products, only: [:edit, :update, :destroy]
    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(products_params)
      if @product.save
        redirect_to dashboard_products_path, notice: "#{@product.description} cadastrado com sucesso!"
      else
        alert_errors
      end
    end

    def edit; end

    def update
      if @product.update(products_params)
        redirect_to dashboard_products_path, notice: "#{@product.description} atualizado com sucesso!"
      else
        alert_errors
      end
    end

    def destroy
      if @product.destroy
        redirect_to dashboard_products_path, notice: "#{@product.description} excluído com sucesso!"
      else
        alert_errors
      end
    end

    private

    def alert_errors
      redirect_to dashboard_products_path, alert: @product.errors.full_messages.to_sentence
    end

    def set_products
      @product = Product.find(params[:id])
    end

    def products_params
      params.require(:product).permit(:code, :ean, :display, :dun, :description, :family_id,
                                      :tax_classification_id, :active, :detach, :photo_product)
    end
  end
end
