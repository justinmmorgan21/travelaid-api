json.id flight.id
json.trip_id flight.trip_id
json.direction flight.direction
json.total_duration flight.total_duration
json.legs flight.legs.order(:leg_number), partial: "legs/leg", as: :leg
json.layovers flight.layovers, partial: "layovers/layover", as: :layover