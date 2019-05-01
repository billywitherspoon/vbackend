class AddMileageToVehicles < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :mileage, :integer
  end
end
