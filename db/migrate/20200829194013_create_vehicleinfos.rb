class CreateVehicleinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicleinfos do |t|
      t.string :brand
      t.string :plate

      t.timestamps
    end
  end
end
