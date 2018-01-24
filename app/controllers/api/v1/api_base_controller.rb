class Api::V1::ApiBaseController < ApplicationController
  before_action :verify_auth_token

  protected

  def verify_auth_token
    authentication_header = request.headers['Authentication']
    api_key =  authentication_header.gsub('Bearer: ', '').strip if authentication_header

    @manager = ApiKey.find_by(auth_token: api_key).try(:manager)
    unauthenticated_request unless @manager
  end

  def unauthenticated_request
    render json: { error: 'This Api Key does not exist.' }, status: 401
  end
end
