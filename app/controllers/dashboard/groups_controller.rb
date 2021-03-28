module Dashboard
  class GroupsController < DashboardController
    before_action :set_groups, only: [:edit, :update, :destroy]
    def index; end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(groups_params)
    if @group.save
      redirect_to dashboard_index_path, notice: "#{@group.description} cadastrado com sucesso!"
    else
      flash.now[:alert] = @group.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @group = Group.update(groups_params)
      redirect_to dashboard_index_path, notice: "#{@group.description} atualizado com sucesso!"
    else
      flash.now[:alert] = @group.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @group = Group.destroy
      redirect_to dashboard_index_path, notice: "#{@group.description} excluído com sucesso!"
    else
      flash.now[:alert] = @group.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def set_groups
    @group = Group.find(params[:id])
  end

  def groups_params
    params.require(:group).permit(:description)
  end
end
