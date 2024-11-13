class ChangeLngToFloatInPlaces < ActiveRecord::Migration[7.1]
  def change
    change_column :places, :lng, :float
  end
end
