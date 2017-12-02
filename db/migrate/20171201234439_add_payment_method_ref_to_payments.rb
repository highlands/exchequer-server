class AddPaymentMethodRefToPayments < ActiveRecord::Migration[5.1]
  def change
    add_reference :payments, :payment_method, foreign_key: true
  end
end
