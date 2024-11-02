# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Trips
Trip.create(user_id: 1, title: "New York", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/New_york_times_square-terabass.jpg/800px-New_york_times_square-terabass.jpg", start_time:'2024-12-22 10:50:00', end_time:'2024-01-03 14:15:00')
Trip.create(user_id: 2, title: "Frisco to San Diego", image_url: "https://i.pinimg.com/736x/ec/eb/5f/eceb5f9093498073ff1dcca1b0ec06af.jpg", start_time:'2025-06-01 10:00:00', end_time:'2025-06-14 21:00:00')

# Places
