module ApplicationHelper
  # convert UTC to users' timezones
  def user_timezone(time)
    offset_min = cookies[:time_zone];
    time - offset_min.to_i.minutes
  end
end
