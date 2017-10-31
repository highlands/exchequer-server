class Api::V1::ApiBaseController < ApplicationController
  before_action :verify_auth_token

  protected

  def verify_auth_token
    @app = ApiKey.find_by(auth_token: request.headers['Authentication']).try(:app)
    unauthenticated_request unless @app
  end

  def unauthenticated_request
    render json: { error: 'There is no application for this Api Key' }, status: 401
  end
end
