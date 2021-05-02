# frozen_string_literal: true

module Dashboard
  class FamiliesController < DashboardController
    before_action :authorize_admin, only: [:destroy]
    before_action :set_families, only: %i[edit update destroy]
    def index
      if params[:group_id].present?
        render(json: Family.where(group_id: params[:group_id]))
      else
        @families = Family.all
      end
    end

    def new
      @family = Family.new
    end

    def create
      @family = Family.new(families_params)
      if @family.save
        redirect_to dashboard_families_path, notice: "#{@family.description} cadastrada com sucesso!"
      else
        alert_errors
      end
    end

    def edit; end

    def update
      if @family.update(families_params)
        redirect_to dashboard_families_path, notice: "#{@family.description} atualizada com sucesso!"
      else
        alert_errors
      end
    end

    def destroy
      if @family.destroy
        redirect_to dashboard_families_path, notice: "#{@family.description} excluída com sucesso!"
      else
        alert_errors
      end
    end

    private

    def alert_errors
      redirect_to dashboard_families_path, alert: @family.errors.full_messages.to_sentence
    end

    def set_families
      @family = Family.find(params[:id])
    end

    def families_params
      params.require(:family).permit(:description, :group_id)
    end

    def authorize_admin
      return if current_user.admin?

      redirect_to dashboard_path, alert: 'Você não tem permissão, contate o Administrador!'
    end
  end
end
