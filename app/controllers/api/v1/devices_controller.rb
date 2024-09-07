module Api
  module V1
    class DevicesController < ApiController
      skip_forgery_protection only: [ :create ]
      def create
        puts "UPDATE RECEIVED"
        puts params
        device = Device.find(params[:device_id])
        if device.nil?
          render json: { message: "No existe ese dispositivo!" }
        else
          if params[:status] == "maintenance"
            DeviceUpdate.create(device_id: device.id, message: "Entro a mantenimeinto")
          elsif params[:status] == "working" && device.status != "working"
            DeviceUpdate.create(device_id: device.id, message: "Ha sido reparado")
          elsif params[:status] == "broken"
            DeviceUpdate.create(device_id: device.id, message: "Fallo")
          end
          device.update(status: params[:status])
          render json: { message: "#{device.name} actualizado a #{device.status}" }
        end
      end

      def index
        render json: { devices: 1 }
      end
    end
  end
end
