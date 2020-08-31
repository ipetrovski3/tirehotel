class CreateTireinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :tireinfos do |t|
      t.string :brand
      t.string :dimension
      t.string :qty
      t.boolean :wheels

      t.timestamps
    end
  end
end
