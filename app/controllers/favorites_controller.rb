class FavoritesController < ApplicationController

  def index

  end

  def create
    @favorite = Favorite.create(room_id: params[:room_id], favorite_folder_id: params[:favorite_folder_id], user_id: current_user.id)
  end

  def destroy

  end
end
