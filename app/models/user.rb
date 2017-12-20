class User < ApplicationRecord
  has_many :payment_methods, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :offers, through: :invoices

  validates :email, presence: true

  before_validation :default_values

  def available_payment_methods
    payment_methods.without_deleted
  end

  def payment_method_present?
    available_payment_methods.any?
  end

  def logout!
    # FIXME: maybe call update_attributes here instead of doing these explicitly?
    self.token = nil
    self.secret = nil
    self.save
  end

  private

  def default_values
    self.admin = false unless self.admin
  end
end
