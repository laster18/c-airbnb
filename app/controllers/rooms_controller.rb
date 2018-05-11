class RoomsController < ApplicationController

  before_action :set_instans, only: [ :room, :bedrooms, :bathrooms, :location, :amenities, :spaces]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def room
  end

  def bedrooms
    session[:room_category_id] = params[:room][:room_category_id]
    session[:room_building_type_id] = params[:room][:room_building_type_id]
    session[:room_type] = params[:room][:room_type]
    session[:only_for_guest] = params[:room][:only_for_guest]
  end

  def bathrooms
    session[:person_capacity] = params[:room][:person_capacity]
    session[:bedroom_number] = params[:room][:bedroom_number]
    session[:bed_number] = params[:room][:bed_number]
  end

  def location
    session[:bathroom_number] = params[:room][:bathroom_number]
  end

  def amenities
    session[:country] = params[:room][:country]
    session[:zipcode] = params[:room][:zipcode]
    session[:state] = params[:room][:state]
    session[:city] = params[:room][:city]
    session[:street] = params[:room][:street]
    session[:apartment] = params[:room][:apartment]
    @amenities = @room.amenities.new
    # @amenities = Amenity.all
  end

  def spaces
    session[:amenity_ids] = params[:room][:amenity_ids]
    session[:safety_amenity_ids] = params[:room][:safety_amenity_ids]
    # @available_spaces = @room.available_spaces.new
  end

  def first_step_finish
    set_sessions
    @room = Room.new(
      user_id: current_user.id,
      room_category_id: @room_category_id,
      room_building_type_id: @room_building_type_id,
      room_type: @room_type,
      only_for_guest: @only_for_guest,
      person_capacity: @person_capacity,
      bedroom_number: @bedroom_number,
      bed_number: @bed_number,
      bathroom_number: @bathroom_number,
      country: @country,
      zipcode: @zipcode,
      state: @state,
      city: @city,
      street: @street,
      apartment: @apartment,
    )
    if current_user.id == @room.user_id
      @room.save
      @room.amenity_ids = @amenity_ids
      @room.safety_amenity_ids = @safety_amenity_ids
      @room.available_space_ids = params[:room][:available_space_ids]
      redirect_to review_room_path(@room)
    else
      redirect_to :index
    end
  end

  def room_review
  end

  private
  def set_instans
    @room = Room.new
  end

  def set_sessions
    @room_category_id = session[:room_category_id]
    @room_building_type_id = session[:room_building_type_id]
    @room_type = session[:room_type]
    @only_for_guest = session[:only_for_guest]
    @person_capacity  = session[:person_capacity]
    @bedroom_number = session[:bedroom_number]
    @bed_number = session[:bed_number]
    @bathroom_number = session[:bathroom_number]
    @country = session[:country]
    @zipcode = session[:zipcode]
    @state = session[:state]
    @city = session[:city]
    @street = session[:street]
    @apartment = session[:apartment]
    @amenity_ids = session[:amenity_ids]
    @safety_amenity_ids = session[:safety_amenity_ids]
    @available_space_ids = session[:available_space_ids]
  end

end
