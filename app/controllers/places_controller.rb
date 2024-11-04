class PlacesController < ApplicationController
  def create
    @place = Place.new(
      trip_id: params[:trip_id],
      address: params[:address],
      name: params[:name],
      description: params[:description],
      image_url: params[:image_url],
      start_time: params[:start_time],
      end_time: params[:end_time],
    )
    if @place.save
      render :show
    else
      render json: {error: @place.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
