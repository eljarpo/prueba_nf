namespace :simulator do
  desc "Simulate a restaurant sending device status updates to the server"

  task run: :environment do |t, args|
      puts "Simulador de restaurantes!"
      puts "Se ha iniciado la simulacion para todos los restaurantes"
      idx = 1
      while true
        device = Device.all.sample
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
          } })

        puts response.body
        puts "Request ##{idx} sent"
        idx += 1
        sleep 1
      end
  end



  task :restaurant, [ :restaurant_id ] => [ :environment ] do |t, args|
    puts args[:restaurant_id]
    idx = 1
    restaurant = Restaurant.find_by(id: args[:restaurant_id])
    puts "Simulador de restaurantes!"
    puts "Se ha iniciado la simulacion para el restaurante #{restaurant.name}"
    while true
      device = restaurant.devices.sample
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
        } })

      puts response.body
      puts "Request ##{idx} sent"
      idx += 1
      sleep 1
    end
  end

  task :device, [ :device_id ] => [ :environment ] do |t, args|
    puts args[:device_id]
    idx = 1
    device = Device.find_by(id: args[:device_id])
    puts "Simulador de restaurantes!"
    puts "Se ha iniciado la simulacion para el dispositivo #{device.name}"
    while true
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
        } })

      puts response.body
      puts "Request ##{idx} sent"
      idx += 1
      sleep 1
    end
  end
end
