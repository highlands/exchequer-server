class RedirectionManager
  class << self
    include Rails.application.routes.url_helpers

    def path_for(params_in_session)
      params_in_session = params_in_session.with_indifferent_access

      controller = params_in_session['controller']
      new_checkout_path(offer_id: params_in_session['offer_id']) if controller == 'checkouts'
    end
  end
end
