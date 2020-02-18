class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper

  def log_in(user)
    user.remember
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def authorize
    redirect_to sign_in_path unless logged_in?
  end
end
