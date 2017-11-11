class RedirectionManager
  class << self
    include Rails.application.routes.url_helpers

    def path_for(name)
      buy_offer_path if name == 'offers'
    end
  end
end
