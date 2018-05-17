class RoomAppointmentsController < ApplicationController

  def index
  end

  def new
  end

  def create
    session[:check_in_date] = params[:room_appointment][:check_in_date]
    session[:check_out_date] = params[:room_appointment][:check_out_date]
    @room = Room.find(params[:room_id])
  end
end
