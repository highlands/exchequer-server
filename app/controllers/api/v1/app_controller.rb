class Api::V1::AppController < Api::V1::ApiBaseController
  def me
    render json: @manager
  end
end
