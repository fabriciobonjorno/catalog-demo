module Dashboard
  class UsersController < DashboardController
    before_action :set_users, only: [:edit, :update, :destroy]
    before_action :allow_without_password, only: [:update]
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(users_params)
      if @user.save
        redirect_to dashboard_users_path, notice: "#{@user.name} cadastrado com sucesso!"
      else
        alert_errors
      end
    end

    def edit; end

    def update
      if @user.update(users_params)
        redirect_to dashboard_users_path, notice: "#{@user.name} atualizado com sucesso!"
      else
        alert_errors
      end
    end

    def destroy
      if @user.destroy
        redirect_to dashboard_users_path, notice: "#{@user.name} excluído com sucesso!"
      else
        alert_errors
      end
    end

    def alert_errors
      redirect_to dashboard_users_path, alert: @user.errors.full_messages.to_sentence
    end

    def set_users
      @user = User.find(params[:id])
    end

    def users_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :profile, :photo_profile)
    end

    # remove o input da validação do devise
    def allow_without_password
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
    end
  end
end
