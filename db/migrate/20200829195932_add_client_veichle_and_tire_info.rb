class AddClientVeichleAndTireInfo < ActiveRecord::Migration[6.0]
  def change
    add_reference :tireinfos, :client, foreign_key: true
    add_reference :vehicleinfos, :client, foreign_key: true
  end
end
