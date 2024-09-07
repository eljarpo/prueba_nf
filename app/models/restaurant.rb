class Restaurant < ApplicationRecord
  has_many :devices
  validates :name, presence: true

  enum status: {
    operational: 0,
    warning: 1,
    problems: 2
  }


  def devices_status
    devices.group(:status).count
  end

  def devices_type_status
    devices.group(:device_type, :status).count
  end
end
