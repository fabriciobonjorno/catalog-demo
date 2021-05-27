# frozen_string_literal: true

module Dashboard
  class LayoutpdfController < DashboardController
    before_action :authorize_admin, only: [:destroy]
    before_action :set_companies, only: %i[edit update destroy]

    def index
      @layoutpdf = Layoutpdf.all
    end

    def edit; end

    def update
      if @layoutpdf.update(layoutpdf_params)
        redirect_to dashboard_layoutpdf_index_path, notice: "#{@layoutpdf.color_header} atualizado com sucesso!"
      else
        alert_errors
      end
    end

    def new
      @layoutpdf = Layoutpdf.new
    end

    def create
      @layoutpdf = Layoutpdf.new(layoutpdf_params)
      if @layoutpdf.save
        redirect_to dashboard_layoutpdf_index_path,
                    notice: 'Layout pdf cadastrada com sucesso!'
      else
        alert_errors
      end
    end

    def destroy
      if @layoutpdf.destroy
        redirect_to dashboard_layoutpdf_index_path, notice: ' excluída com sucesso!'
      else
        alert_errors
      end
    end

    private

    def layoutpdf_params
      params.permit(:id, :color_header, :type_logo, :_destroy)
    end

    def alert_errors
      redirect_to dashboard_layoutpdf_index_path, alert: @layoutpdf.errors.full_messages.to_sentence
    end

    def set_companies
      @layoutpdf = Layoutpdf.find(params[:id])
    end

    def authorize_admin
      return if current_user.admin?

      redirect_to dashboard_path, alert: 'Você não tem permissão, contate o Administrador!'
    end
  end
end
