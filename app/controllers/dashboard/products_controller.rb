# frozen_string_literal: true

module Dashboard
  class ProductsController < DashboardController
    before_action :authorize_admin, only: [:destroy]
    before_action :set_products, only: %i[edit update destroy]

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def create
      @company = Company.first
      @product = Product.new(products_params)
      if @product.save
        redirect_to dashboard_products_path, notice: "#{@product.description} cadastrado com sucesso!"
        ProductMailer.send_detach_product(@product, @company).deliver_now!
      else
        alert_errors
      end
    end

    def edit; end

    def update
      @company = Company.first
      if @product.update(products_params)
        redirect_to dashboard_products_path, notice: "#{@product.description} atualizado com sucesso!"
        ProductMailer.send_detach_product(@product, @company).deliver_now!
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
      @product = Product.friendly.find(params[:id])
    end

    def products_params
      params.require(:product).permit(:code, :ean, :display, :dun, :description, :family_id,
                                      :tax_classification_id, :active, :detach, :photo_product, :quantitie)
    end

    def authorize_admin
      return if current_user.admin?

      redirect_to dashboard_path, alert: 'Você não tem permissão, contate o Administrador!'
    end
  end
end
