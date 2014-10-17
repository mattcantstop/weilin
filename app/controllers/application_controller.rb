class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  before_action :check_api_key, :find_and_validate_user

  private

  def find_and_validate_user
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.find_by_token(token)
      if @current_user.nil?
        render 'errors/show.rabl', :status => :unauthorized
      end

      return @current_user
    end
  end

  def check_api_key
    api_key = request.headers['HTTP_API_KEY']
    if Accessor.find_by_api_key(api_key).nil?
      raise ActionController::RoutingError.new('Resource Not Found')
    end
  end

end
