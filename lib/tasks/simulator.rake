namespace :simulator do
  desc "Simulate a restaurant sending device status updates to the server"

  task run: :environment do |t, args|
      puts "Simulador de restaurantes!"
      puts "Se ha iniciado la simulacion para todos los restaurantes"
      run_simulation(nil, nil)
  end

  task :restaurant, [ :restaurant_id ] => [ :environment ] do |t, args|
    restaurant = Restaurant.find_by(id: args[:restaurant_id])
    puts "Simulador de restaurantes!"
    puts "Se ha iniciado la simulacion para el restaurante #{restaurant.name}"
    run_simulation(restaurant.id, nil)
  end

  task :device, [ :device_id ] => [ :environment ] do |t, args|
    device = Device.find_by(id: args[:device_id])
    puts "Simulador de restaurantes!"
    puts "Se ha iniciado la simulacion para el dispositivo #{device.name}"
    run_simulation(nil, device.id)
  end

  def run_simulation(restaurant_id = nil, device_id = nil)
    idx = 1
    while true
      device = Restaurant.find_by(id: restaurant_id).devices.sample if restaurant_id.present?
      device = Device.find_by(id: device_id) if device_id.present?
      device = Device.all.sample if (restaurant_id.nil? && device_id.nil?) || device.nil?

      status_rand = Random.rand(0..10)
      status = :working
      case status_rand
      when 0..4
        status = :working
        if status_rand.even?
          message = "Ha sido reparado"
        else
          message = "Poco papel"
        end
      when 5..7
        status = :maintenance
        message = "Enviado a mantencion"
      when 8..10
        status = :broken
        if status_rand.even?
          message = "No funciona"
        else
          message = "Sin bateria"
        end
      end
      response = HTTParty.post("http://localhost:3000/api/v1/devices", {
        body: {
          device: {
            id: device.id,
            status: status
          },
          message: message
        }
      })

      puts response.body
      puts "Request ##{idx} sent"
      idx += 1
      sleep 1
    end
  end
end
