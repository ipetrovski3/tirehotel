class AddSeasonReferenceToTireinfo < ActiveRecord::Migration[6.0]
  def change
    add_reference :tireinfos, :season, foreign_key: true
  end
end
