json.id trip.id
json.user_id trip.user_id
json.title trip.title
json.image_url trip.image_url
json.start_time trip.start_time_converted
json.end_time trip.end_time_converted 
json.places trip.places.order(:start_time), partial: "places/place", as: :place
json.center trip.center
json.initial_zoom trip.initial_zoom
json.flights trip.flights, partial: "flights/flight", as: :flight
json.flight_booked trip.flight_booked