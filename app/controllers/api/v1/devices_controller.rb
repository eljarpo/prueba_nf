module Api
  module V1
    class DevicesController < ApiController
      skip_forgery_protection only: [ :create ]
      def create
        device = Device.find_by(id: params[:device][:id])
        if device.nil?
          render json: { message: "No existe ese dispositivo!" }
        else
          if device.update!(device_params)
            device.create_device_update(device_params, params[:message])
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
