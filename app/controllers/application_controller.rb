class ApplicationController < ActionController::Base
  include HighlandsAuth::ApplicationHelper
  protect_from_forgery with: :exception

  def spreedly_env
    Spreedly::Environment.new(Rails.application.secrets.spreedly_key, Rails.application.secrets.spreedly_secret)
  end

  def authenticate_admin!
    redirect_to auth.new_session_path unless current_user.try(:admin?)
  end

  def authenticate_user!
    redirect_to auth.new_session_path unless current_user
  end
end
