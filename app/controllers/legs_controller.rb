class LegsController < ApplicationController
  def create
    @leg = Leg.new(
      flight_id: params[:flight_id],
      leg_number: params[:leg_number],
      airline: params[:airline],
      airline_logo: params[:airline_logo],
      airplane: params[:airplane],
      departure_airport_id: params[:departure_airport_id],
      departure_airport_name: params[:departure_airport_name],

      departure_day: DateTime.parse(params[:departure_airport_time]).strftime("%a, %b %-d"),
      departure_airport_time: Time.parse(params[:departure_airport_time]).strftime("%-I:%M%P"),

      departure_airport_city: params[:departure_airport_city],
      arrival_airport_id: params[:arrival_airport_id],
      arrival_airport_name: params[:arrival_airport_name],

      arrival_day: DateTime.parse(params[:arrival_airport_time]).strftime("%a, %b %-d"),
      arrival_airport_time: Time.parse(params[:arrival_airport_time]).strftime("%-I:%M%P"),
      
      arrival_airport_city: params[:arrival_airport_city],
      duration: (params[:duration].to_i/60).to_s+"hr " + (params[:duration].to_i%60).to_s+"min",
      flight_number: params[:flight_number],
    )
    if @leg.save!
      render :show
    else
      render json: {error: @leg.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
