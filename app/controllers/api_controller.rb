class ApiController < ApplicationController
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Only allow requests with the application/json content type.
  # allow_content_type :json
end
