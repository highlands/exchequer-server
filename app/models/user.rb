class User < ApplicationRecord
  before_validation :default_values
  validates :email, presence: true
  has_many :payment_methods, dependent: :destroy

  def payment_method_present?
    payment_methods.without_deleted.any?
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
