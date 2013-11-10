class BudgetsController < ApplicationController

  before_action :find_budget, only: [:update, :destroy]

  def create
    @budget = Budget.new(budget_params)
    @budget.user_id = current_user.id
    if @budget.save
      flash[:notice] = "Successfully added your budget"
    else
      flash[:error] = @budget.errors.full_messages.join("<br />")
    end
    redirect_to trips_path
  end

  def update
    @budget.user_id = current_user.id
    if @budget.update(budget_params)
      flash[:notice] = "Successfully updated your budget"
    else
      flash[:error] = @budget.errors.full_messages.join("<br />")
    end
    redirect_to trips_path
  end

  def destroy
    @budget.destroy
    flash[:notice] = "You have successfully deleted a budget"
    redirect_to trips_path
  end


  private

  def budget_params
    params.require(:budget).permit(:budget, :date_from, :date_to)
  end

  def find_budget
    @budget = Budget.find(params[:id])
  end
end
