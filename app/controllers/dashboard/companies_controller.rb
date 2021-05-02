module Dashboard
  class CompaniesController < DashboardController
    before_action :set_companies, :only => %i[edit update]

    def index
      @companies = Company.all
    end

    def edit; end

    def update
      if @company.update(companies_params)
        redirect_to dashboard_companies_path, :notice => "#{@company.social_name} atualizada com sucesso!"
      else
        alert_errors
      end
    end

    private

    def alert_errors
      redirect_to dashboard_companies_path, :alert => @company.errors.full_messages.to_sentence
    end

    def set_companies
      @company = Company.find(params[:id])
    end

    def companies_params
      params.require(:company).permit(:social_name, :fantasy_name, :cnpj, :ie, :street, :number, :complement, :district,
                                      :zip_code, :city, :state, :phone, :phone, :email, :site, :photo_company)
    end
  end
end
