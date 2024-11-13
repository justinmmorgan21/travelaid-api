class PlacesController < ApplicationController
  def create
    results = Geocoder.search(params[:address])
    coords = results.first.coordinates
    @place = Place.new(
      trip_id: params[:trip_id],
      address: params[:address],
      name: params[:name],
      description: params[:description],
      image_url: params[:image_url],
      start_time: params[:start_time],
      end_time: params[:end_time],
      lat: coords[0],
      lng: coords[1]
    )
    if @place.save
      render :show
    else
      render json: {error: @place.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @place = Place.find_by(id: params[:id])
    # results = Geocoder.search(@place.address)
    # p "*************"
    # pp results.first.coordinates
    # p "*************"
    render :show
  end
end
