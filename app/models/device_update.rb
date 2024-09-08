class DeviceUpdate < ApplicationRecord
  belongs_to :device
  after_create -> {
    broadcast_prepend_to(
      :device,
      target: "device_updates",
      partial: "devices/device_update",
      locals: { device_update: self }
      )
  }
end
