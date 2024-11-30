class AddDefaultToFlightBookedInTrips < ActiveRecord::Migration[7.1]
  def change
    change_column_default :trips, :flight_booked, from: nil, to: false
  end
end
