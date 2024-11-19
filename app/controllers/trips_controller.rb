class TripsController < ApplicationController
  def create
    @trip = Trip.new(
      user_id: current_user.id,
      title: params[:title],
      image_url: params[:image_url],
      start_time: params[:start_time],
      end_time: params[:end_time],
    )
    if @trip.save
      render :show
    else
      render json: {error: @trip.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def index
    @trips = Trip.where(user_id: current_user)
    render :index
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    render :show
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    if @trip
      @trip.title = params[:title] || @trip.title,
      @trip.image_url = params[:image_url] || @trip.image_url,
      @trip.start_time = params[:start_time] || @trip.start_time,
      @trip.end_time = params[:end_time] || @trip.end_time,
      
      if @trip.save
        render :show
      else
        render json: {error: @trip.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: { error: "Trip not found" }, status: :not_found
    end
  end

  def next
    @trips = Trip.where(user_id: current_user).order(:start_time)
    @trip = @trips && @trips.first() || nil
    if @trip
      render :show
    else
      render json: {}
    end
  end

  def suggested
    admin_id = User.find_by(name: "admin")
    @trips = Trip.where(user_id: admin_id)
    render :index
  end
end