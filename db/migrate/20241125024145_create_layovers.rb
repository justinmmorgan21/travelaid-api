class CreateLayovers < ActiveRecord::Migration[7.1]
  def change
    create_table :layovers do |t|
      t.integer :flight_id
      t.string :duration
      t.string :airport_id
      t.string :airport_name
      t.string :airport_city

      t.timestamps
    end
  end
end
