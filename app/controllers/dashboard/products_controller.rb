module Dashboard
  class ProductsController < DashboardController
    def index; end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(products_params)
      if @product.save
        redirect_to dashboard_index_path, notice: "#{@product.description} cadastrado com sucesso!"
      else
        flash.now[:alert] = @product.errors.full_messages.to_sentence
        render :new
      end
    end

    def edit; end

    def update
      if @product.update(products_params)
        redirect_to dashboard_index_path, notice: "#{@product.description} atualizado com sucesso!"
      else
        flash.now[:alert] = @product.errors.full_messages.to_sentence
        render :edit
      end
    end

    def destroy
      if @product.destroy
        redirect_to dashboard_index_path, notice: "#{@product.description} excluído com sucesso!"
      else
        flash.now[:alert] = @product.errors.full_messages.to_sentence
        render :index
      end
    end

    private

    def set_products
      @product = Product.find(params[:id])
    end

    def products_params
      params.require(:product).permit(:code, :ean, :display, :description, :family_id, :tax_classification_id)
    end
  end
end
