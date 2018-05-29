class RoomAppointmentsController < ApplicationController

  def index
  end

  def preview
    @room             = Room.find(params[:room_id])
    @room_appointment = RoomAppointment.new

    @check_in_date          = params[:room_appointment][:check_in_date]
    @check_in_date          = RoomCalendar.find(@check_in_date)
    @check_in_date          = @check_in_date.date
    session[:check_in_date] = @check_in_date

    @check_out_date          = params[:room_appointment][:check_out_date]
    @check_out_date          = RoomCalendar.find(@check_out_date)
    @check_out_date          = @check_out_date.date
    session[:check_out_date] = @check_out_date

    @number_of_nights = @check_out_date - @check_in_date
    @number_of_nights = @number_of_nights.to_i

    @adult                    = params[:room_appointment][:number_of_adult]
    session[:number_of_adult] = @adult

    @child                     = params[:room_appointment][:number_of_child]
    session[:number_of_child]  = @child
    session[:number_of_infant] = params[:room_appointment][:number_of_infant]

    @people = @adult.to_i + @child.to_i

    @total_fee          = @number_of_nights.to_i * @room.day_fee_cents.to_i
    session[:total_fee] = @total_fee
  end

  def create
    @room_appointment = RoomAppointment.new(appointment_params)
    if @room_appointment.save
      check_in_date  = @room_appointment.check_in_date
      check_out_date = @room_appointment.check_out_date - 1
      while check_out_date >= check_in_date do
        @room_calendar = RoomCalendar.find_by(room_id: params[:room_id], date: check_out_date)
        @room_calendar.destroy
        check_out_date -= 1
      end
      redirect_to action: :index
    else
      render :preview
    end
  end

  private

  def appointment_params
    params.require(:room_appointment).permit(:message).merge(check_in_date: session[:check_in_date],
                                                             check_out_date: session[:check_out_date],
                                                             number_of_adult: session[:number_of_adult],
                                                             number_of_child: session[:number_of_child],
                                                             number_of_infant: session[:number_of_infant],
                                                             room_id: params[:room_id],
                                                             user_id: current_user.id,
                                                             total_fee: session[:total_fee])
  end
end
