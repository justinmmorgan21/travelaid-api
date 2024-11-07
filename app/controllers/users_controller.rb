class UsersController < ApplicationController
  def create
    image = Cloudinary::Uploader.upload(params[:image])
    pp image['url']
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      image_url: image['url'] || "https://img.freepik.com/premium-vector/free-vector-user-icon-simple-line_901408-588.jpg"
    )
    if @user.save!
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    render json: {
      id: current_user.id,
      name: current_user.name,
      email: current_user.email,
      image_url: current_user.image_url
    }
  end
end

