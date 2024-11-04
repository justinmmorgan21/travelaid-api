# json.extract! trip, :id, :created_at, :updated_at
# json.url trip_url(trip, format: :json)
json.id trip.id
json.user_id trip.user_id
json.title trip.title
json.image_url trip.image_url
json.start_time trip.start_time.strftime("%B %d, %Y")
json.end_time trip.end_time.strftime("%B %d, %Y")