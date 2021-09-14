class PlansController < ApplicationController

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    if @plan.save
      redirect_to plans_path
    else
      render :new
    end
  end

  def edit
  end


  def index
    @plan = Plan.all
    @new_plan = Plan.page(params[:page]).reverse_order
  end

  def show
    @plan = Plan.find(params[:id])
    @user = @plan.user
    @plan_comment = PlanComment.new
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plans_path
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :content, :introduction, :name)
  end
end
