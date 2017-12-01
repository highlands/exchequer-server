class AddCardInformationToPaymentMethod < ActiveRecord::Migration[5.1]
  def change
    add_column :payment_methods, :card_type, :string
    add_column :payment_methods, :last_four_digits, :string
  end
end
