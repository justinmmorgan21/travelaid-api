class FlightsController < ApplicationController
  def create
    @flight = Flight.new(
      trip_id: params[:trip_id],
      direction: params[:direction],
      total_duration: (params[:total_duration].to_i/60).to_s+"hr " + (params[:total_duration].to_i%60).to_s+"min",
    )
    if @flight.save
      render :show
    else
      render json: {error: @flight.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
