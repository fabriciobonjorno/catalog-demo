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
      search_email_company
      @product = Product.new(products_params)
      if @product.save
        redirect_to dashboard_products_path, notice: "#{@product.description} cadastrado com sucesso!"
        @subscriber.each do |subscriber|
          ProductMailer.send_detach_product(@product, @company, subscriber).deliver_now!
        end
      else
        alert_errors
      end
    end

    def edit; end

    def update
      # search_email_company # Usar para testes
      if @product.update(products_params)
        redirect_to dashboard_products_path, notice: "#{@product.description} atualizado com sucesso!"
        # @subscriber.each do |subscriber| Usar para testes
        #   ProductMailer.send_detach_product(@product, @company, subscriber).deliver_now!
        # end
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

    def search_email_company
      @company = Company.first
      @subscriber = Subscriber.all.where(unsubscribe: false)
    end

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
