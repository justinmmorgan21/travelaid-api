class CreateLegs < ActiveRecord::Migration[7.1]
  def change
    create_table :legs do |t|
      t.integer :flight_id
      t.string :airline
      t.string :airline_logo
      t.string :airplane
      t.string :departure_airport_id
      t.string :departure_airport_name
      t.string :departure_airport_time
      t.string :departure_airport_city
      t.string :arrival_airport_id
      t.string :arrival_airport_name
      t.string :arrival_airport_time
      t.string :arrival_airport_city
      t.string :duration
      t.string :flight_number

      t.timestamps
    end
  end
end
