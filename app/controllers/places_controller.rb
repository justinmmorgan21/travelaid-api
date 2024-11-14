require 'net/http'
require 'uri'
class PlacesController < ApplicationController
  def create
    results = Geocoder.search(params[:address])
    pp "RESULTS"
    pp results.first.coordinates
    coords = results.first.coordinates
    @place = Place.new(
      trip_id: params[:trip_id],
      address: params[:address],
      name: params[:name],
      description: params[:description],
      image_url: params[:image_url],
      start_time: params[:start_time] || DateTime.now,
      end_time: params[:end_time] || DateTime.now,
      lat: coords[0],
      lng: coords[1]
    )
    if @place.save
      render :show
    else
      render json: {error: @place.errors.full_messages}, status: :unprocessable_entity
    end
    # render json: {message: "complete"}
  end

  def show
    @place = Place.find_by(id: params[:id])
    api_key = ENV['GOOGLE_MAPS_API_KEY']
    
    # Set up the URL for the geocoding request
    # 11 Naitomachi, Shinjuku City, Tokyo 160-0014, Japan
    url = URI("https://maps.googleapis.com/maps/api/geocode/json?address=11+Naitomachi,+Shinjuku+City,+Tokyo+160-0014,+Japan&key=#{api_key}")
    # url = URI("https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=#{api_key}")
    
    # Make the request and parse the response
    response = Net::HTTP.get(url)
    json = JSON.parse(response)
    p "**************"
    pp json
    p "**************"
    # results = Geocoder.search("11+Naitomachi,+Shinjuku+City,+Tokyo,+Japan")
    # p "*************"
    # pp results.first.coordinates
    # p "*************"
    render :show
  end
end


