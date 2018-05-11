class UsersController < ApplicationController
  def edit
  end

  def update
    binding.pry
    if current_user.update(profile_params)
      respond_to do |format|
        format.html { redirect_to edit_user_path, notice: 'プロフィールを更新しました。' }
        format.json
      end
    else
      render :edit
    end
  end

  def avatar
  end

  private

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :gender, :birthday_month, :birthday_day, :birthday_year, :email, :tel_number, :preferred_locale, :native_currency, :current_city, :about, :avatar)
  end

  def avatar_params
    params.require(:user).permit(:avatar)
  end
end
