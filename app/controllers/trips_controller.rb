class TripsController < ApplicationController

  helper_method :sort_column, :sort_direction

  before_filter :find_trip, except: [:index, :new, :create]
  before_filter :list_budget, only: [:index]

  def show
  end

  def index
    @trips = Trip.order(sort_column + " " + sort_direction)
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new
    @trip.attributes = params[:trip].permit(:name)
    if @trip.save
      redirect_to action: 'show', id: @trip.id
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    @trip.attributes = params[:trip].permit(:name)
    if @trip.save
      redirect_to action: 'show', id: @trip.id
    else
      render action: 'edit'
    end
  end

  def destroy
    @trip.destroy
    flash[:notice] = "You have successfully deleted a trip"
    redirect_to action: 'index'
  end

 private

 def find_trip
   id = params[:trip_id] ? params[:trip_id] : params[:id]
   @trip = Trip.find(id)
 end

 def list_budget
   @budgets = Budget.order('date_from desc')
   @budget = Budget.new
 end

 def sort_column
   Trip.column_names.include?(params[:sort]) ? params[:sort] : "name"
 end

 def sort_direction
   %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
 end

end
