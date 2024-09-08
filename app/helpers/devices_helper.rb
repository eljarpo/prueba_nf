module DevicesHelper
  def device_status_name(status)
    case status
    when "working"
      "Operacional"
    when "maintenance"
      "Mantenimiento"
    when "broken"
      "Dañado"
    else
      status.capitalize.to_s
    end
  end
end
