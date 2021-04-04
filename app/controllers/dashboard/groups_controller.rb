module Dashboard
  class GroupsController < DashboardController
    before_action :set_groups, only: [:edit, :update, :destroy]
    def index
      @groups = Group.all
    end

    def new
      @group = Group.new
    end

    def create
      @group = Group.new(groups_params)
      if @group.save
        redirect_to dashboard_groups_path, notice: "#{@group.description} cadastrado com sucesso!"
      else
        alert_errors
      end
    end

    def edit; end

    def update
      if @group.update(groups_params)
        redirect_to dashboard_groups_path, notice: "#{@group.description} atualizado com sucesso!"
      else
        alert_errors
      end
    end

    def destroy
      if @group.destroy
        redirect_to dashboard_groups_path, notice: "#{@group.description} excluído com sucesso!"
      else
        alert_errors
      end
    end

    private

    def alert_errors
      redirect_to dashboard_groups_path, alert: @group.errors.full_messages.to_sentence
    end

    def set_groups
      @group = Group.find(params[:id])
    end

    def groups_params
      params.require(:group).permit(:description)
    end
  end
end
