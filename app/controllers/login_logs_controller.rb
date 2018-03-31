class LoginLogsController < ApplicationController
  def index
    @login_logs = LoginLog.recent
  end
end
