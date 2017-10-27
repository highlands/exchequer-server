class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable,
    :validatable
  before_validation :default_values

  private

  def default_values
    self.admin = false if self.admin.nil?
  end
end
