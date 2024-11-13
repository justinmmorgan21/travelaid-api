class AddLatAndLongToPlaces < ActiveRecord::Migration[7.1]
  def change
    add_column :places, :lat, :integer
    add_column :places, :lng, :integer
  end
end
