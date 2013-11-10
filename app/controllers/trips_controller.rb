class TripsController < ApplicationController

  helper_method :sort_column, :sort_direction

  before_action :find_trip, except: [:index, :new, :create]
  before_action :list_budget, only: [:index]

  def show
  end

  def index
    @trips = Trip.where(user_id: current_user.id).order([sort_column, sort_direction].join(" "))
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id

    if @trip.save
      redirect_to action: 'show', id: @trip.id
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    @trip.user_id = current_user.id
    if @trip.update(trip_params)
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

 def trip_params
   params.require(:trip).permit(:name)
 end

 def list_budget
   @budgets = Budget.where(user_id: current_user.id).order('date_from desc')
   @budget = Budget.new
 end

 def sort_column
   Trip.column_names.include?(params[:sort]) ? params[:sort] : "name"
 end

 def sort_direction
   %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
 end

end
