class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_timezone 

  def set_timezone  
    min = request.cookies["time_zone"].to_i
    puts min
    Time.zone = ActiveSupport::TimeZone[-min]
    puts Time.zone
  end 
end
