class RedirectionManager
  class << self
    include Rails.application.routes.url_helpers

    def path_for(params_in_session)
      controller = params_in_session['controller']
      buy_offer_path(offer_id: params_in_session['offer_id']) if controller == 'offers'
    end
  end
end
