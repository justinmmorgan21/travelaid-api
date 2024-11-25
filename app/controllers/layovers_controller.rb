class LayoversController < ApplicationController
  def create
    @layover = Layover.new(
      flight_id: params[:flight_id],
      duration: (params[:duration].to_i/60).to_s+"hr " + (params[:duration].to_i%60).to_s+"min",
      airport_id: params[:airport_id],
      airport_name: params[:airport_name],
      airport_city: params[:airport_city],
    )
    if @layover.save
      render :show
    else
      render json: {error: @layover.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
