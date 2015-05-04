class ApplicationController < ActionController::Base
  before_filter :add_allow_credentials_headers

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def add_allow_credentials_headers
    response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
    response.headers['Access-Control-Allow-Credentials'] = 'true'
  end
end
