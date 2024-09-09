# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Restaurant.create!(name: "Restaurnate numero uno")
Restaurant.create!(name: "Comida rapida y buena")
Restaurant.create!(name: "Pizza delivery")

Restaurant.all.each do |restaurant|
  Device.create(name: "POS #1", restaurant_id: restaurant.id, status: :working, device_type: :pos)
  Device.create(name: "POS #2", restaurant_id: restaurant.id, status: :working, device_type: :pos)
  Device.create(name: "POS #3", restaurant_id: restaurant.id, status: :working, device_type: :pos)
  Device.create(name: "POS #4", restaurant_id: restaurant.id, status: :working, device_type: :pos)
  Device.create(name: "Impresora #1", restaurant_id: restaurant.id, status: :working, device_type: :printer)
  Device.create(name: "Impresora #2", restaurant_id: restaurant.id, status: :working, device_type: :printer)
  Device.create(name: "Impresora #3", restaurant_id: restaurant.id, status: :working, device_type: :printer)
  Device.create(name: "Impresora #4", restaurant_id: restaurant.id, status: :working, device_type: :printer)
  Device.create(name: "Sistema de red", restaurant_id: restaurant.id, status: :working, device_type: :network)
  Device.create(name: "Monitor #1", restaurant_id: restaurant.id, status: :working, device_type: :monitor)
  Device.create(name: "Monitor #2", restaurant_id: restaurant.id, status: :working, device_type: :monitor)
  Device.create(name: "Monitor #3", restaurant_id: restaurant.id, status: :working, device_type: :monitor)
  Device.create(name: "Monitor #4", restaurant_id: restaurant.id, status: :working, device_type: :monitor)
  Device.create(name: "Computador #1", restaurant_id: restaurant.id, status: :working, device_type: :computer)
  Device.create(name: "Computador #2", restaurant_id: restaurant.id, status: :working, device_type: :computer)
  Device.create(name: "Computador #3", restaurant_id: restaurant.id, status: :working, device_type: :computer)
  Device.create(name: "Computador #4", restaurant_id: restaurant.id, status: :working, device_type: :computer)
end
