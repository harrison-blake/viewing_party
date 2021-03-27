class DiscoverController < ApplicationController
  before_action :require_current_user

  def index
    @user = current_user
  end

  private

  def require_current_user
    render file: '/public/401' unless current_user
  end
end
