class FavoritesController < ApplicationController

  def index
  end

  def create
    @favorite = Favorite.create(room_id: params[:room_id], favorite_folder_id: params[:favorite_folder_id], user_id: current_user.id)
  end

  def destroy
    @favorite = Favorite.find_by(room_id: params[:room_id], favorite_folder_id: params[:favorite_folder_id], user_id: current_user.id)
    @favorite.destroy
  end
end
