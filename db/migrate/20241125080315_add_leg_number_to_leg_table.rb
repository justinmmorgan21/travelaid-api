class AddLegNumberToLegTable < ActiveRecord::Migration[7.1]
  def change
    add_column :legs, :leg_number, :integer
  end
end
