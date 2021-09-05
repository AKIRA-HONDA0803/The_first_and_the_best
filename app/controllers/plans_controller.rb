class PlansController < ApplicationController

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    @plan.save
    redirect_to plans_path
  end

  def index
    @plan = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plan_path
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :content)
  end
end
