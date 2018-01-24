class Api::V1::ApiBaseController < ApplicationController
  before_action :verify_auth_token

  protected

  def verify_auth_token
    @manager = ApiKey.find_by(auth_token: request.headers['Authentication']).try(:manager)
    unauthenticated_request unless @manager
  end

  def unauthenticated_request
    render json: { error: 'This Api Key does not exist.' }, status: 401
  end
end
