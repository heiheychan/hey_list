module ApplicationHelper

  def user_timezone(time)
    offset_min = cookies[:time_zone];
    time - offset_min.to_i.minutes
  end
end
