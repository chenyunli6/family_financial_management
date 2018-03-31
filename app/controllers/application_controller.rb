class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin!
    redirect_to root_path, alert: "没有权限浏览该页面" if !current_user.is_admin
  end
end
