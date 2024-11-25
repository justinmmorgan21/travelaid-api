class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.integer :trip_id
      t.string :direction
      t.string :total_duration

      t.timestamps
    end
  end
end
