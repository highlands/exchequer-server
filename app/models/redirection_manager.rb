# FIXME: this should be a module and maybe in an app/services folder
class RedirectionManager
  class << self
    # change these methods into def self.foo
    include Rails.application.routes.url_helpers

    def path_for(params_in_session)
      params_in_session = params_in_session.with_indifferent_access

      controller = params_in_session['controller']
      id = params_in_session['id']

      return invoice_path(id) if controller == 'invoices' && id

      return offer_path(id) if controller == 'offers' && id
    end
  end
end
