
class ApplicationController < ActionController::Base
  include Crowd::SingleSignOn

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :authenticate

  private
    def authenticate
      return if RAILS_ENV == "test"

      return if crowd_authenticated?

      authenticate_or_request_with_http_basic('Demo Application') do |user_name, password|
        crowd_authenticate(user_name, password)
      end
    end
end
