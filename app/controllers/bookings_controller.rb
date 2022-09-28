class BookingsController < ApplicationController
  before_action :get_user, only: [:index, :new, :create]
  before_action :get_not_booked_demons, only: [:new]

  def index
    @bookings = @user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new()
  end

  def create
    @booking = Booking.new({demon_id: booking_params[:demon_id], user_id: @user.id})

    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      redirect_to new_booking_path, alert: 'Booking was not created.'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:demon_id)
  end

  def get_not_booked_demons
    @bookings = Booking.all
    booked_demons = @bookings.map { |booking| booking.demon }
    @demons = Demon.not_booked(booked_demons)
  end

  def get_user
    @user = current_user
  end
end
