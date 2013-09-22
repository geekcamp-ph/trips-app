class ItinerariesController < ApplicationController

  helper_method :sort_column, :sort_direction

  before_filter :find_trip

  def show
    @itinerary = Itinerary.find(params[:id])
  end

  def index
    @itineraries = @trip.itineraries.order(sort_column + " " + sort_direction)
  end

  def new
    @itinerary = Itinerary.new(trip: @trip)
  end

  def create
    @itinerary = Itinerary.new
    @itinerary.attributes = params[:itinerary].permit(:location, :travel_on, :estimated_cost, :trip_id)
    if @itinerary.save
      redirect_to action: 'show', id: @itinerary.id
    else
      render action: 'new'
    end
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    @itinerary.attributes = params[:itinerary].permit(:location, :travel_on, :estimated_cost, :trip_id)
    if @itinerary.save
      redirect_to action: 'show', id: @itinerary.id
    else
      render action: 'edit'
    end
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy
    flash[:notice] = "You have successfully deleted a itinerary"
    redirect_to action: 'index'
  end

  private

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def sort_column
   Itinerary.column_names.include?(params[:sort]) ? params[:sort] : "location"
  end

  def sort_direction
   %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
