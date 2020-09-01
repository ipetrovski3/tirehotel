class Client < ApplicationRecord
  belongs_to :warehouse

  has_many :tireinfos, dependent: :destroy
  has_many :vehicleinfos, dependent: :destroy

  accepts_nested_attributes_for :tireinfos, allow_destroy: true
  accepts_nested_attributes_for :vehicleinfos, allow_destroy: true

  def self.search(pattern)
    if pattern.blank? # blank? covers both nil and empty string
      all
    else
      where('name LIKE ?', "%#{pattern}%")
    end
  end
end
