class RoomCalendarsController < ApplicationController
  def index
    @dates = RoomCalendar.where(room_id: params[:room_id]).pluck(:date)
    @dates_json = @dates.to_json.html_safe
    respond_to do |format|
      format.html
      format.json { @dates_json }
    end
  end

  def create
    @room_calendar = RoomCalendar.create(date_params)
  end

  def destroy
    @room_calendar = RoomCalendar.find_by(room_id: params[:room_id], date: params[:date])
    @room_calendar.destroy
  end

  private
  def date_params
    params.permit(:date, :room_id)
  end
end
