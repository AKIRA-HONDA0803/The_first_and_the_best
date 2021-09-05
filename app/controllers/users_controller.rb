class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @plan = @user.plans
  end
end
