class FavoriteFoldersController < ApplicationController

  def index
    @favorite_folders = FavoriteFolder.where(user_id: params[:user_id])
    @favorite_folder = FavoriteFolder.new
  end

  def show
    @favorites = FavoriteFolder.find(params[:id]).favorites
    gon.addresses = []
    @favorites.each do |favorite|
      @room = favorite.room
      gon.address = @room.state + @room.city + @room.street
      gon.addresses << gon.address
    end
  end

  def create
    @favorite_folder = FavoriteFolder.new(favorite_folder_params)
    if @favorite_folder.save
      respond_to do |format|
        format.html { redirect_to user_favorite_folders_path(current_user) }
        format.json
      end
    else
      redirect_to root_path
    end
  end

  def update
  end

  private
  def favorite_folder_params
    params.require(:favorite_folder).permit(:name, :release).merge(user_id: current_user.id)
  end
end
