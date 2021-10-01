class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @plan = @user.plans
    @favorites = Favorite.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def index
    @user = User.all
  end

  def favorites
    @user = User.find_by(id: params[:id])
     @favorites = Favorite.where(user_id: @user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
