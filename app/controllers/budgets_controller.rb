class BudgetsController < ApplicationController

  def create
    @budget = Budget.new
    @budget.attributes = params[:budget].permit(:budget, :date_from, :date_to)
    if @budget.save
      flash[:notice] = "Successfully added your budget"
    else
      flash[:error] = @budget.errors.full_messages.join("<br />")
    end
    redirect_to trips_path
  end

  def update
    @budget = Budget.find(params[:id])
    @budget.attributes = params[:budget].permit(:budget, :date_from, :date_to)
    if @budget.save
      flash[:notice] = "Successfully updated your budget"
    else
      flash[:error] = @budget.errors.full_messages.join("<br />")
    end
    redirect_to trips_path
  end

  def destroy
    @budget = Budget.find(params[:id])
    @budget.destroy
    flash[:notice] = "You have successfully deleted a budget"
    redirect_to trips_path
  end

end
