class BookingsController < ApplicationController
  before_action :get_user, only: [:index, :new, :create]

  def index
    @bookings = @user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new()
    @bookings_all = Booking.all
    @demons_all = Demon.all

    @demons = @demons_all.reject do |demon|
      @bookings_all.any? { |booking| booking.demon_id == demon.id }
    end
  end

  def create
    @booking = Booking.new({demon_id: booking_params[:demon_id], user_id: @user.id})

    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      redirect_to new_booking_path, alert: 'Booking was not created.'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:demon_id)
  end

  def get_user
    @user = current_user
  end
end
