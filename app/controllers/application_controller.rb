class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  include SessionsHelper

  before_action :require_login

  private

  def require_login
    redirect_to root_url unless signed_in?
  end

  def jump_to_dashboard
    redirect_to '/dashboard' unless !signed_in?
  end
end
