class AddDepartureDayAndArrivalDayToLeg < ActiveRecord::Migration[7.1]
  def change
    add_column :legs, :departure_day, :string
    add_column :legs, :arrival_day, :string
  end
end
