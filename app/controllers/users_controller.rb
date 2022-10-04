class UsersController < ApplicationController
  def index
    @users = User.all
    authorize @users
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to users_path, notice: 'Demon was successfully created.'
    else
      redirect_to edit_user_path(@user), alert: @user.errors[:roles][0]
    end
  end

  private

  def user_params
    params.require(:user).permit(role_ids: [])
  end
end
