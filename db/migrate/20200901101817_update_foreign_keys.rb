class UpdateForeignKeys < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :tireinfos, :clients
    remove_foreign_key :vehicleinfos, :clients

    add_foreign_key :tireinfos, :clients, on_delete: :cascade
    add_foreign_key :vehicleinfos, :clients, on_delete: :cascade
  end
end
