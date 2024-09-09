class Restaurant < ApplicationRecord
  has_many :devices
  has_many :device_updates, through: :devices
  validates :name, presence: true

  # enum status: {
  #   operational: 0,
  #   warning: 1,
  #   problems: 2
  # }

  def status
    status = :operational
    devices.device_types.keys.each do |device_type|
      if devices.where(device_type: device_type).working.count ==  0
        status = :problems
        return status
      elsif devices.where(device_type: device_type).working.count < devices.where(device_type: device_type).count
        status = :warning
      end
    end
    status
  end


  def devices_status
    devices.group(:status).count
  end

  def devices_type_status
    devices_by_status = Hash.new
    devices.order(:id).each do |device|
      devices_by_status[device.device_type] = Hash.new if devices_by_status[device.device_type].nil?
      devices_by_status[device.device_type][device.status] = 0 if devices_by_status[device.device_type][device.status].nil?
      devices_by_status[device.device_type][device.status] += 1
    end
    devices_by_status
  end

  def last_device_update_date
    device_updates.last.created_at
  end
end
