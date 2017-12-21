module RedirectionManager
  def self.path_for(params_in_session)
    url_helpers = Rails.application.routes.url_helpers
    params_in_session = params_in_session.with_indifferent_access

    controller = params_in_session['controller']
    id = params_in_session['id']

    return url_helpers.invoice_path(id) if controller == 'invoices' && id

    return url_helpers.offer_path(id) if controller == 'offers' && id
  end
end
