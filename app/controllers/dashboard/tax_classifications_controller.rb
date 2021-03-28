module Dashboard
  class TaxClassificationsController < DashboardController
    before_action :set_tax_classifications, only: [:edit, :update, :destroy]
    def index; end

    def new
      @tax_classification = TaxClassification.new
    end

    def create
      @tax_classification = TaxClassification.new(tax_classifications_params)
      if @tax_classification.save
        redirect_to dashboard_index_path, notice: "#{@tax_classification.description} cadastrada com sucesso!"
      else
        flash.now[:alert] = @tax_classification.errors.full_messages.to_sentence
        render :new
      end
    end

    def edit; end

    def update
      if @tax_classification.update(tax_classifications_params)
        redirect_to dashboard_index_path, notice: "#{@tax_classification.description} atualizada com sucesso!"
      else
        flash.now[:alert] = @tax_classification.errors.full_messages.to_sentence
        render :edit
      end
    end

    def destroy
      if @tax_classification.destroy
        redirect_to dashboard_index_path, notice: "#{@tax_classification.description} excluída com sucesso!"
      else
        flash.now[:alert] = @tax_classification.errors.full_messages.to_sentence
        render :index
      end
    end

    private

    def set_tax_classifications
      @tax_classification = TaxClassification.find(params[:id])
    end

    def tax_classifications_params
      params.require(:tax_classification).permit(:description)
    end
  end
end
