class ApiKey < ApplicationRecord
  # API Keys belong to a Manager and are used to interface with the API. We use the Rails 5
  # has_secure_token methods to generate the token.

  belongs_to :manager

  has_secure_token :auth_token

  validates :manager, presence: true
  validates :auth_token, presence: true
end
