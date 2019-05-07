class AddPlateStateToVehicles < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :plate_state, :string
  end
end

