class AddPlantStateToVehicles < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :plant_state, :string
  end
end
