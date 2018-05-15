class RoomsController < ApplicationController
  before_action :set_room, only: [ :room_type, :bedrooms, :bathrooms, :location, :amenities, :spaces, :confirmation, :photos, :description, :title, :second_step_finish]

  before_action :first_step_update, only: [ :bedrooms, :bathrooms, :location, :amenities, :spaces]

  def index() end

  def show() end

  def new() end

  def create() end

  def has_rooms_list() end

  def room_type() end

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
    @amenities = @room.amenities.build
  end

  def spaces
    session[:amenity_ids] = params[:room][:amenity_ids]
    session[:safety_amenity_ids] = params[:room][:safety_amenity_ids]
  end

  def first_step_finish
    if params[:id]
      @room = Room.find(params[:id])
      first_step_update
    else
      set_sessions_first
      @room = new_room
      if current_user.id == @room.user_id
        @room.save
        @room.amenity_ids = @amenity_ids
        @room.safety_amenity_ids = @safety_amenity_ids
        @room.available_space_ids = params[:room][:available_space_ids]
      else
        redirect_to :index
      end
    end
    redirect_to confirmation_room_path(@room)
  end

  def confirmation() end

  def photos
    @room_image = @room.room_images.build
  end

  def photos_create
    @room_image = RoomImage.new(image_params)
    if @room_image.save
      respond_to do |format|
        format.html
        format.json
      end
    else
      render :photos_create
    end
  end

  def description() end

  def title
    @room.update(second_step_update_params)
    @room.recommendation_ids = params[:room][:recommendation_ids]
  end

  def second_step_finish
    @room.update(second_step_update_params)
    redirect_to confirmation_room_path(@room)
  end

  def fee
    @room = Room.find(params[:id])
  end

  def availability_settings
    @room = Room.find(params[:id])
    @room.update(third_step_update_params)
  end

  private

  def set_room
    params[:id].present? ? @room = Room.find(params[:id]) : @room = Room.new
  end

  def set_sessions_first
    @room_category_id = session[:room_category_id]
    @room_building_type_id = session[:room_building_type_id]
    @room_type = session[:room_type]
    @only_for_guest = session[:only_for_guest]
    @person_capacity = session[:person_capacity]
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

  def new_room
    Room.new(
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
      apartment: @apartment
    )
  end

  def first_step_update
    @room.update(first_step_update_params) if params[:id]
  end

  def first_step_update_params
    params.require(:room).permit(:room_category_id, :room_building_type_id, :room_type, :only_for_guest, :person_capacity, :bedroom_number, :bed_number, :bathroom_number, :country, :zipcode, :state, :city, :street, :apartment, amenity_ids: [], safety_amenity_ids: [], available_space_ids: [])
  end

  def second_step_update_params
    params.require(:room).permit(:overview, :title)
  end

  def third_step_update_params
    params.require(:room).permit(:day_fee, :native_currency)
  end

  def set_sessions_second
    @overview = session[:overview]
    @recommendation_ids = session[:recommendation_ids]
  end

  def image_params
    params.require(:room_image).permit(:image).merge(room_id: params[:id])
  end
end
