class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable,
    :validatable, :omniauthable, omniauth_providers: [:github]
  before_validation :default_values
  has_many :oauth_authorizations, dependent: :destroy
  has_many :payment_methods, dependent: :destroy

  def payment_method_present?
    payment_methods.any?
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
