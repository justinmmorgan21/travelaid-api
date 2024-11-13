class ChangeLatToFloatInPlaces < ActiveRecord::Migration[7.1]
  def change
    change_column :places, :lat, :float
  end
end
