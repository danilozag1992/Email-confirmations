class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  helper_method :current_user, :signed_in?, :is_admin?

  def is_admin?
    user_signed_in? ? current_user.admin : false
  end
end
