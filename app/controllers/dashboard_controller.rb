class DashboardController < ApplicationController
  before_action :require_current_user

  def index
    @user = current_user
    @friends = @user.followed
  end

  private

  def require_current_user
    render file: '/public/401' unless current_user
  end
end
