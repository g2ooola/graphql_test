class BaseController < ApplicationController
  attr_reader :current_admin, :current_user

  private

  def try_authenticate_user_by_secret!
    return unless user_header_secret
    @current_user = User.find_by(secret: user_header_secret)
  end

  def try_authenticate_admin_by_secret!
    return unless admin_header_secret
    @current_admin = Admin.find_by(secret: admin_header_secret)
  end

  def user_header_secret
    @user_header_secret ||= request_header('user-api-key')
  end

  def admin_header_secret
    @admin_header_secret ||= request_header('admin-api-key')
  end

  def request_header(header_key)
    request.headers[header_key] || request.headers["HTTP_#{header_key.gsub(/-/, '_').upcase}"]
  end
end