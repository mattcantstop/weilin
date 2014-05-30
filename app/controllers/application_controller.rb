class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  before_action :check_token

  private

  def check_token
    authenticate_or_request_with_http_token do |token, options|
      User.where(token: token)
    end
  end

end
