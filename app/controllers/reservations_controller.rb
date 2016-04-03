require "date"

class ReservationsController < ApplicationController
  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to @reservation
    else
      render 'new'
    end
  end

  private

  def reservation_params
    fields = params.require(:reservation).permit(:first_name,
                                                 :last_name,
                                                 :confirmation,
                                                 :flight_time)
    fields[:flight_time] = to_datetime(fields[:flight_time])
    fields
  end

  def to_datetime(time_str)
    format = '%Y-%m-%d %H:%M %Z'
    DateTime.strptime(time_str, format)
  end
end
