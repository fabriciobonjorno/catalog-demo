module Dashboard
  class ManufacturersController < DashboardController
    before_action :authorize_admin, :only => [:destroy]
    before_action :set_manufacturers, only: %i[edit update destroy]
    def index
      @manufacturers = Manufacturer.all
    end

    def new
      @manufacturer = Manufacturer.new
    end

    def create
      @manufacturer = Manufacturer.new(manufacturers_params)
      if @manufacturer.save
        redirect_to dashboard_manufacturers_path, :notice => "#{@manufacturer.description} cadastrado com sucesso!"
      else
        alert_errors
      end
    end

    def edit; end

    def update
      if @manufacturer.update(manufacturers_params)
        redirect_to dashboard_manufacturers_path, :notice => "#{@manufacturer.description} atualizado com sucesso!"
      else
        alert_errors
      end
    end

    def destroy
      if @manufacturer.destroy
        redirect_to dashboard_manufacturers_path, :notice => "#{@manufacturer.description} excluído com sucesso!"
      else
        alert_errors
      end
    end

    private

    def alert_errors
      redirect_to dashboard_manufacturers_path, :alert => @manufacturer.errors.full_messages.to_sentence
    end

    def set_manufacturers
      @manufacturer = Manufacturer.find(params[:id])
    end

    def manufacturers_params
      params.require(:manufacturer).permit(:description)
    end

    def authorize_admin
      return if current_user.admin?

      redirect_to dashboard_path, :alert => 'Você não tem permissão, contate o Administrador!'
    end
  end
end
