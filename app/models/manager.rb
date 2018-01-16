class Manager < ApplicationRecord
  # A Manager is the parent of all other objects in the data model. All other data should be
  # segmented by manager.

  NotInSession = Class.new(StandardError)

  validates :name, presence: true
  validates :public_token, presence: true

  has_many :api_keys, dependent: :destroy
  has_many :offers, dependent: :destroy

  before_validation :set_public_token, on: :create

  private

  def set_public_token
    self.public_token = SecureRandom.hex(10)
  end
end
