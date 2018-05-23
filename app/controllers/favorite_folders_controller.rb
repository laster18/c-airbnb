class FavoriteFoldersController < ApplicationController

  def index
    @favorite_folders = FavoriteFolder.where(user_id: params[:user_id])
    @favorite_folder = FavoriteFolder.new
  end

  def show
  end

  def create
    @favorite_folder = FavoriteFolder.new(favorite_folder_params)
    if current_user = params[:user_id]
      @favorite_folder.save
      redirect_to user_favorite_folders_path(current_user)
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
