class UsersController < ApplicationController
  # Leaving in code that could be used later if want to
  # change new user to add image at creation time.
  # Right now, new user will always have the default image.
  def create 
    image = params[:image] && Cloudinary::Uploader.upload(params[:image])
    image_url = image && image['url']
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      image_url: image_url || "https://img.freepik.com/premium-vector/free-vector-user-icon-simple-line_901408-588.jpg"
    )
    if @user.save!
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
  
  def update
    @user = User.find_by(id: [params[:id]])
    image = params[:image] != "no-image" && Cloudinary::Uploader.upload(params[:image])
    image_url = image && image['url']
    @user.update(
      name: params[:name] || @user.name,
      email: params[:email] || @user.email,
      image_url: image_url || @user.image_url || "https://img.freepik.com/premium-vector/free-vector-user-icon-simple-line_901408-588.jpg"
    )
    if @user.save!
      render json: { message: "User updated successfully" }, status: :created
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

