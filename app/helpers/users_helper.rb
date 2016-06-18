module UsersHelper
  def contact_lack?
    (current_user.wechat == "" || current_user.wechat == nil) && (current_user.contact_email == "" || current_user.contact_email == nil) && (current_user.phone == "" || current_user.phone == nil)
  end
end