class RoomsController < ApplicationController

  before_action :set_instans, only: [ :room, :bedrooms, :bathrooms, :location, :amenities]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def room
    session[:rooms] = @rooms
  end

  def bedrooms
    session[:room_category_id] = params[:room][:room_category_id]
    session[:room_building_type_id] = params[:room][:room_building_type_id]
    session[:room_type] = params[:room][:room_type]
    session[:only_for_guest] = params[:room][:only_for_guest]
  end

  def bathrooms
    session[:person_capacity] = params[:room][:person_capacity]
    session[:edroom_number] = params[:room][:bedroom_number]
    session[:bed_number] = params[:room][:bed_number]
  end

  def location

  end

  def amenities

  end

  private
  def room_params
    params.require(:room)
  end

  def set_instans
    @rooms = Room.new
  end
end
