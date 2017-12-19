class User < ApplicationRecord
  before_validation :default_values
  validates :email, presence: true
  has_many :payment_methods, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :offers, through: :invoices

  def available_payment_methods
    payment_methods.without_deleted
  end

  def payment_method_present?
    available_payment_methods.any?
  end

  def logout!
    self.token = nil
    self.secret = nil
    self.save
  end

  private

  def default_values
    self.admin = false if self.admin.nil?
  end
end
