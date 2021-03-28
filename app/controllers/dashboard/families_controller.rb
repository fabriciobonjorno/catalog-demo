module Dashboard
  class FamiliesController < DashboardController
    before_action :set_families, only: [:edit, :update, :destroy]
    def index; end

    def new
      @family = Family.new
    end

    def create
      @family = Family.new(families_params)
      if @family.save
        redirect_to dashboard_index_path, notice: "#{@family.description} cadastrada com sucesso!"
      else
        flash.now[:alert] = @family.errors.full_messages.to_sentence
        render :new
      end
    end

    def edit; end

    def update
      if @family.update(families_params)
        redirect_to dashboard_index_path, notice: "#{@family.description} atualizada com sucesso!"
      else
        flash.now[:alert] = @family.errors.full_messages.to_sentence
        render :edit
      end
    end

    def destroy
      if @family.destroy
        redirect_to dashboard_index_path, notice: "#{@family.description} excluída com sucesso!"
      else
        flash.now[:alert] = @family.errors.full_messages.to_sentence
        render :index
      end
    end

    private

    def set_families
      @family = Family.find(params[:id])
    end

    def families_params
      params.require(:family).permit(:description, :group_id)
    end
  end
end
