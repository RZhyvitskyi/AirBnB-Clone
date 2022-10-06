class DemonsController < ApplicationController
  before_action :get_demons, only: [:index, :new]
  before_action :get_user, only: [:show, :create]

  def index
    # Talk about pagination
  end

  def show
    @demon = Demon.find(params[:id])
    @review = Review.new
  end

  def new
    @demon = Demon.new
  end

  def create
    @demon = Demon.new({**demon_params, user_id: @user.id})

    if @demon.save
      redirect_to demons_path, notice: 'Demon was successfully created.'
    else
      redirect_to new_demon_path, alert: 'Demon was not created.'
    end
  end

  private

  def demon_params
    params.require(:demon).permit(:name, :speciality, :location, :picture_url)
  end

  def get_user
    @user = current_user
  end

  def get_demons
    @demons = Demon.all
  end
end
