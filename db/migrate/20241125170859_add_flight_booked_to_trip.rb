class AddFlightBookedToTrip < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :flight_booked, :boolean
  end
end
