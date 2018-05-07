class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(profile_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def avatar
    current_user.update(avatar: params[:avatar])
  end

  private

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :gender, :birthday_month, :birthday_day, :birthday_year, :email, :tel_number, :preferred_locale, :native_currency, :current_city, :about, :avatar)
  end

  def avatar_params
  end
end
