class DeviceUpdateJob
  include Sidekiq::Job

  def perform(id, status, message)
    # Do something
    device = Device.find_by(id: id)
    if device.present?
      device.create_device_update(status, message)
    end
  end
end
