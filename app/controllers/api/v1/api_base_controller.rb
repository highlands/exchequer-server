class Api::V1::ApiBaseController < ApplicationController
  before_action :verify_auth_token

  protected

  def verify_auth_token
    @manager = ApiKey.find_by(auth_token: request.headers['Authentication']).try(:manager)
    unauthenticated_request unless @manager
  end

  def unauthenticated_request
    render json: { error: 'There is no application for this Api Key' }, status: 401
  end
end
