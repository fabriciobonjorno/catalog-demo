module Dashboard
  class ManufacturersController < ApplicationController
    before_action :set_manufacturers, only: [:edit, :update, :destroy]
    def index
      @manufacturers = Manufacturer.all
    end

    def new
      @manufacturer = Manufacturer.new
    end

    def create
      @manufacturer = Manufacturer.new(manufacturers_params)
      if @manufacturer.save
        redirect_to dashboard_manufacturers_path, notice: "#{@manufacturer.description} cadastrado com sucesso!"
      else
        alert_errors
      end
    end

    def edit; end

    def update
      if @manufacturer.update(manufacturers_params)
        redirect_to dashboard_manufacturers_path, notice: "#{@manufacturer.description} atualizado com sucesso!"
      else
        alert_errors
      end
    end

    def destroy
      if @manufacturer.destroy
        redirect_to dashboard_manufacturers_path, notice: "#{@manufacturer.description} excluído com sucesso!"
      else
        alert_errors
      end
    end

    def alert_errors
      redirect_to dashboard_manufacturers_path, alert: @manufacturer.errors.full_messages.to_sentence
    end

    def set_manufacturers
      @manufacturer = Manufacturer.find(params[:id])
    end

    def manufacturers_params
      params.require(:manufacturer).permit(:description)
    end
  end
end
