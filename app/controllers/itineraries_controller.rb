class ItinerariesController < ApplicationController
  def show
    @itinerary = Itinerary.find(params[:id])
  end

  def index
    @itineraries = Itinerary.all
  end
  
  def new
    @itinerary = Itinerary.new  
  end
  
  def create
    @itinerary = Itinerary.new
    @itinerary.attributes = params[:itinerary].permit(:location, :travel_on)
    @itinerary.save
    redirect_to action: 'show', id: @itinerary.id
  end
  
  def edit
    @itinerary = Itinerary.find(params[:id])
  end
  
  def update
    @itinerary = Itinerary.find(params[:id])
    @itinerary.attributes = params[:itinerary].permit(:location, :travel_on)
    @itinerary.save
    redirect_to action: 'show', id: @itinerary.id
  end
  
  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy
    flash[:notice] = "You have successfully deleted a itinerary"
    redirect_to action: 'index'
  end
end
