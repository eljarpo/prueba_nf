module Api
  module V1
    class DevicesController < ApiController
      skip_forgery_protection only: [ :create ]
      def create
        device = Device.find_by(id: params[:device][:id])
        if device.nil?
          render json: { message: "No existe ese dispositivo!" }
        else
          if params[:device][:status] == "maintenance" && device.status != "maintenance"
            DeviceUpdate.create(device_id: device.id, message: "Entro a mantenimeinto")
          elsif params[:device][:status] == "working" && device.status != "working"
            DeviceUpdate.create(device_id: device.id, message: "Ha sido reparado")
          elsif params[:device][:status] == "broken" && device.status != "broken"
            DeviceUpdate.create(device_id: device.id, message: "Ha fallado")
          end
          if device.update!(device_params)
            render json: { message: "#{device.name} actualizado a #{device.status}" }
          else
            render json: { message: "Error al actualizar el dispositivo" }
          end
        end
      end


      private

      def device_params
        params.require(:device).permit(:id, :status)
      end
    end
  end
end
