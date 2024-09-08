class Device < ApplicationRecord
  belongs_to :restaurant
  has_many :device_updates
  after_update_commit -> {
    broadcast_replace_to(
      :restaurants,
      target: "restaurant_#{self.restaurant_id}",
      partial: "restaurants/restaurant",
      locals: { restaurant: self.restaurant }
    )
    broadcast_replace_to(
      :devices,
      target: "device_#{self.id}",
      partial: "restaurants/device",
      locals: { device: self }
    )
    broadcast_replace_to(
      :device,
      target: "device_#{self.id}",
      partial: "devices/device",
      locals: { device: self }
    )
  }

  enum status: {
    working: 0,
    broken: 1,
    maintenance: 2
  }

  enum device_type: {
    printer: 0,
    pos: 1,
    monitor: 2,
    network: 3,
    computer: 4
}
end
