class DeviceUpdate < ApplicationRecord
  belongs_to :device, dependent: :destroy
  validates :message, presence: true
  validates :device_id, presence: true
  after_create -> {
    broadcast_prepend_to(
      :device,
      target: "device_updates",
      partial: "devices/device_update",
      locals: { device_update: self }
      )
  }
end
