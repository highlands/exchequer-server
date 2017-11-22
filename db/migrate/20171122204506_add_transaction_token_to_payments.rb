class AddTransactionTokenToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :transaction_token, :string
  end
end
