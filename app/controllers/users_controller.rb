class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: 'Demon was successfully created.'
    else
      redirect_to users_path, alert: 'Demon was not created.'
    end
  end

  private

  def user_params
    params.require(:user).permit(role_ids: [])
  end
end
