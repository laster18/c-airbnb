class RoomsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def room
    @rooms = Room.new
  end

  def bedrooms
    @rooms = Room.new(room_params)
    @rooms.save
  end

  private
  def room_params
    params.require(:room).permit(:room_category_id , :room_building_type_id , :room_type , :only_for_guest )
  end
end
