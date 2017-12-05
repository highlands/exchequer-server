class AddDeletedAtToPaymentMethods < ActiveRecord::Migration[5.1]
  def change
    add_column :payment_methods, :deleted_at, :datetime
    add_index :payment_methods, :deleted_at
  end
end
