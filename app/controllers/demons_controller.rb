class DemonsController < ApplicationController
  before_action :get_demons, only: [:index, :new]

  def index
    @demons = Demon.all
  end

  def show
    @demon = Demon.find(params[:id])
  end

  def new
    @demon = Demon.new
  end

  private

  def get_demons
    @demons = Demon.all
  end
end
