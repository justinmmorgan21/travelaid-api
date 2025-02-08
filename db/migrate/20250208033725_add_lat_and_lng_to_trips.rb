class AddLatAndLngToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :lat, :float
    add_column :trips, :lng, :float
  end
end
