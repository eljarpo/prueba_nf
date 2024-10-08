class DeviceUpdate < ApplicationRecord
  belongs_to :device, dependent: :destroy
  validates :message, presence: true
  validates :device_id, presence: true
  after_create -> {
    broadcast_prepend_to(
      :device,
      target: "device_#{self.device_id}_updates",
      partial: "devices/device_update",
      locals: { device_update: self }
      )
    broadcast_replace_to(
      :devices,
      target: "last_update_date",
      partial: "restaurants/last_update_date",
      locals: { date: self.created_at }
      )
  }
end
