class BookingsController < ApplicationController
  before_action :get_user, only: [:index]

  def index
    @bookings = @user.bookings
  end

  def show
  end

  def new
  end

  private

  def get_user
    @user = current_user
  end
end
