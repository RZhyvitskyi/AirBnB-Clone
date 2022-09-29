class BookingsController < ApplicationController
  before_action :get_user, only: [:index, :new, :create, :confirmation, :update]
  before_action :get_not_booked_demons, only: [:new, :search]
  before_action :get_datetime, only: [:create]

  def index
    @bookings = @user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new()
    @search = true
  end

  def search
    @demons = Demon.search_by_name(params[:name], @demons) unless params[:name] == ""

    @booking = Booking.new
    @search = true
    render :new
  end

  def create
    @booking = Booking.new(demon_id: booking_params[:demon_id], user_id: @user.id, from_date: @from_date, to_date: @to_date)

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

  def confirmation
    @bookings = @user.my_demon_bookings
  end

  def update
    @booking = Booking.find(params[:booking_id])
    @booking.toggle! :approved
    @booking.save
    UserMailer.with(user: @user).confirmation_email.deliver_now
  end

  private

  def booking_params
    params.require(:booking)
  end

  def get_not_booked_demons
    @bookings = Booking.all
    booked_demons = @bookings.map { |booking| booking.demon }
    @demons = Demon.not_booked(booked_demons)
  end

  def get_user
    @user = current_user
  end

  def get_datetime
    @from_date = DateTime.new(booking_params["from_date(1i)"].to_i,
                 booking_params["from_date(2i)"].to_i,
                 booking_params["from_date(3i)"].to_i,
                 booking_params["from_date(4i)"].to_i,
                 booking_params["from_date(5i)"].to_i)

    @to_date = DateTime.new(booking_params["to_date(1i)"].to_i,
                           booking_params["to_date(2i)"].to_i,
                           booking_params["to_date(3i)"].to_i,
                           booking_params["to_date(4i)"].to_i,
                           booking_params["to_date(5i)"].to_i)          
  end
end
