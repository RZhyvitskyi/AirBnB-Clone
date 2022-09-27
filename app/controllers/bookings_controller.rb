class BookingsController < ApplicationController
  before_action :get_user, only: [:index, :new]

  def index
    @bookings = @user.bookings
  end

  def show
  end

  def new
    @booking = Booking.new()
    @bookings_all = Booking.all
    @demons_all = Demon.all

    @demons = @demons_all.reject do |demon|
      @bookings_all.any? { |booking| booking.demon_id == demon.id }
    end
  end

  private

  def get_user
    @user = current_user
  end
end
