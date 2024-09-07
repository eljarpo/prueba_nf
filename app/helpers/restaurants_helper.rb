module RestaurantsHelper
  def status_name(status)
    case status
    when "operational"
      "Operacional"
    when "warning"
      "Advertencia"
    when "Problemas"
      "Problems"
    else
      status.capitalize.to_s
    end
  end
end
