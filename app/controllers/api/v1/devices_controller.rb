module Api
  module V1
    class DevicesController < ApiController
      skip_forgery_protection only: [ :create ]
      def create
        device = Device.find_by(id: params[:device_id])
        if device.nil?
          render json: { message: "No existe ese dispositivo!" }
        else
          if params[:status] == "maintenance"
            DeviceUpdate.create(device_id: device.id, message: "Entro a mantenimeinto")
          elsif params[:status] == "working" && device.status != "working"
            DeviceUpdate.create(device_id: device.id, message: "Ha sido reparado")
          elsif params[:status] == "broken"
            DeviceUpdate.create(device_id: device.id, message: "Ha fallado")
          end
          device.update(status: params[:status])
          render json: { message: "#{device.name} actualizado a #{device.status}" }
        end
      end
    end
  end
end
