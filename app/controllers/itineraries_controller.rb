class ItinerariesController < ApplicationController
  def show
    @itinerary = Itinerary.find(params[:id])
  end

  def index
    @itineraries = Itinerary.all
  end
end
