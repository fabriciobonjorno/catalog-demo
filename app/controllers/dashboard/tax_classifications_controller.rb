module Dashboard
  class TaxClassificationsController < DashboardController
    before_action :authorize_admin, :only => [:destroy]
    before_action :set_tax_classifications, :only => %i[edit update destroy]
    def index
      @tax_classifications = TaxClassification.all
    end

    def new
      @tax_classification = TaxClassification.new
    end

    def create
      @tax_classification = TaxClassification.new(tax_classifications_params)
      if @tax_classification.save
        redirect_to dashboard_tax_classifications_path,
                    :notice => "Classificação fiscal #{@tax_classification.description} cadastrada com sucesso!"
      else
        alert_errors
      end
    end

    def edit; end

    def update
      if @tax_classification.update(tax_classifications_params)
        redirect_to dashboard_tax_classifications_path,
                    :notice => "Classificação fiscal #{@tax_classification.description} atualizada com sucesso!"
      else
        alert_errors
      end
    end

    def destroy
      if @tax_classification.destroy
        redirect_to dashboard_index_path,
                    :notice => "Classificação fiscal #{@tax_classification.description} excluída com sucesso!"
      else
        alert_errors
      end
    end

    private

    def alert_errors
      redirect_to dashboard_tax_classifications_path, :alert => @tax_classification.errors.full_messages.to_sentence
    end

    def set_tax_classifications
      @tax_classification = TaxClassification.find(params[:id])
    end

    def tax_classifications_params
      params.require(:tax_classification).permit(:description)
    end

    def authorize_admin
      return if current_user.admin?

      redirect_to dashboard_path, :alert => 'Você não tem permissão, contate o Administrador!'
    end
  end
end
