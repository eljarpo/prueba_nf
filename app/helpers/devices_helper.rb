module DevicesHelper
  def device_status_name(status)
    case status
    when "working"
      "Operacional"
    when "maintenance"
      "En mantenimiento"
    when :broken
      "Dañado"
    else
      status.capitalize.to_s
    end
  end
end
