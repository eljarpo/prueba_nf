class Device < ApplicationRecord
  belongs_to :restaurant
  has_many :device_updates

  enum status: {
    working: 0,
    broken: 1,
    maintenance: 2
  }

  enum type: {
    printer: 0,
    pos: 1,
    monitor: 2,
    network: 3,
    computer: 4
}
end
