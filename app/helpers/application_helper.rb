module ApplicationHelper
  def device_type_name(device_type)
    case device_type
    when "pos"
      "POS"
    when "printer"
      "Impresora"
    when "network"
      "Sistema de red"
    when "monitor"
      "Monitor"
    when "computer"
      "Computador"
    else
      device_type.capitalize.to_s
    end
  end
end
