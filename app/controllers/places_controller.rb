require 'net/http'
require 'uri'
class PlacesController < ApplicationController
  def create
    api_key = ENV['GOOGLE_MAPS_API_KEY']
    url = URI("https://maps.googleapis.com/maps/api/geocode/json?address=#{CGI::escape(params[:address])}&key=#{api_key}")
    response = Net::HTTP.get(url)
    json = JSON.parse(response)
    coords = json["results"][0]["geometry"]["location"]
    
    @place = Place.new(
      trip_id: params[:trip_id],
      address: params[:address],
      name: params[:name],
      description: params[:description],
      image_url: params[:image_url],
      start_time: params[:start_time],
      end_time: params[:end_time],
      lat: coords["lat"],
      lng: coords["lng"]
    )
    if @place.save
      render :show
    else
      render json: {error: @place.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @place = Place.find_by(id: params[:id])
    render :show
  end

  def destroy
    @place = Place.find_by(id: params[:id])
    if @place.destroy
      render json: { message: @place.name + " destroyed successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @place = Place.find_by(id: params[:id])
    if @place
      @place.start_time = params[:start_time] || @place.start_time
      if @place.save!
        render :show
      else
        render json: {error: @place.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: { error: "Place not found" }, status: :not_found
    end
  end
end


