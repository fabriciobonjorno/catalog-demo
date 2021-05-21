# frozen_string_literal: true

module Dashboard
  class LayoutpdfController < DashboardController
    before_action :authorize_admin, only: [:destroy]

    def index
      @layoutpdf = Layoutpdf.all
    end

    def edit; end

    def new
      @layoutpdf = Layoutpdf.new
    end

    def create
      @layoutpdf = Layoutpdf.new(layoutpdf_params)
      if @layoutpdf.save
        redirect_to dashboard_layoutpdf_path,
                    notice: 'Layout pdf cadastrada com sucesso!'
      else
        alert_errors
      end
    end

    private

    def layoutpdf_params
      params.require(:layoutpdf).permit(:color_header, :type_logo)
    end

    def alert_errors
      redirect_to dashboard_layoutpdf_path, alert: @layoutpdf.errors.full_messages.to_sentence
    end

    def set_companies
      @layoutpdf = Layoutpdf.find(params[:id])
    end
  end
end
