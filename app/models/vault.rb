class Vault
  class << self
    def env
      Spreedly::Environment.new(Rails.application.secrets.spreedly_key, Rails.application.secrets.spreedly_secret)
    end
  end
end
