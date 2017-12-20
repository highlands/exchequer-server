# FIXME: maybe make this a module in services folder?
class Vault
  def self.env
    Spreedly::Environment.new(Rails.application.secrets.spreedly_key, Rails.application.secrets.spreedly_secret)
  end
end
