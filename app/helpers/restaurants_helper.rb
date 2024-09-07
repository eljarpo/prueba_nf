module RestaurantsHelper
  def status_name(status)
    case status
    when :operational
      "Operacional"
    when :warning
      "Advertencia"
    when :problems
      "Problemas"
    else
      status.capitalize.to_s
    end
  end
end
